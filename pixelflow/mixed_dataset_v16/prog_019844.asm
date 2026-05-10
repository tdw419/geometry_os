; DESCRIPTION: Composite: Creates a red circular shape at (54, 61) with radius 29 then Draws a blue line from (163, 0) to (263, 7) then Places a orange dot at position (326, 112).
; PLAN: r0=54(x), r1=61(y), r2=29(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=163(x1), r6=0(y1), r7=263(x2), r8=7(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=326(x), r11=112(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 54
LDI r1, 61
LDI r2, 29
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 163
LDI r6, 0
LDI r7, 263
LDI r8, 7
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 326
LDI r11, 112
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
