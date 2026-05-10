; DESCRIPTION: Composite: Draws a orange rectangle at (77, 47) with width 57 and height 39 then Sets a single blue pixel at (120, 104) then Renders a yellow line between points (247, 207) and (423, 18).
; PLAN: r0=77(x), r1=47(y), r2=57(width), r3=39(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=120(x), r6=104(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=247(x1), r11=207(y1), r12=423(x2), r13=18(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 77
LDI r1, 47
LDI r2, 57
LDI r3, 39
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 120
LDI r6, 104
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 247
LDI r11, 207
LDI r12, 423
LDI r13, 18
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
