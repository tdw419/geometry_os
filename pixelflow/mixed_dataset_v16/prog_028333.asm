; DESCRIPTION: Composite: Sets a single magenta pixel at (177, 164) then Creates a orange rectangular region at (227, 6) spanning 54 by 74 pixels then Draws a green line from (291, 94) to (39, 25).
; PLAN: r0=177(x), r1=164(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=227(x), r6=6(y), r7=54(width), r8=74(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=291(x1), r11=94(y1), r12=39(x2), r13=25(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 177
LDI r1, 164
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 227
LDI r6, 6
LDI r7, 54
LDI r8, 74
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 291
LDI r11, 94
LDI r12, 39
LDI r13, 25
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
