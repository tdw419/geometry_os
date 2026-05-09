; DESCRIPTION: Composite: Places a green line segment connecting (275, 150) to (280, 40) then Places a yellow circle of radius 54 at center (161, 115) then Places a white dot at position (268, 12).
; PLAN: r0=275(x1), r1=150(y1), r2=280(x2), r3=40(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=161(x), r6=115(y), r7=54(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=268(x), r11=12(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 275
LDI r1, 150
LDI r2, 280
LDI r3, 40
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 161
LDI r6, 115
LDI r7, 54
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 268
LDI r11, 12
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
