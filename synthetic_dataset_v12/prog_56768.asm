; DESCRIPTION: Composite: Places a white line segment connecting (486, 63) to (419, 251) then Renders a orange box of size 85x46 starting at (202, 82) then Places a blue circle of radius 44 at center (446, 115).
; PLAN: r0=486(x1), r1=63(y1), r2=419(x2), r3=251(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=202(x), r6=82(y), r7=85(width), r8=46(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=446(x), r11=115(y), r12=44(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 486
LDI r1, 63
LDI r2, 419
LDI r3, 251
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 202
LDI r6, 82
LDI r7, 85
LDI r8, 46
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 446
LDI r11, 115
LDI r12, 44
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
