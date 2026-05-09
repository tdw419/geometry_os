; DESCRIPTION: Composite: Places a black 51x70 rectangle at position (194, 36) then Places a white line segment connecting (450, 204) to (340, 78) then Places a magenta dot at position (393, 201).
; PLAN: r0=194(x), r1=36(y), r2=51(width), r3=70(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=450(x1), r6=204(y1), r7=340(x2), r8=78(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=393(x), r11=201(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 194
LDI r1, 36
LDI r2, 51
LDI r3, 70
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 450
LDI r6, 204
LDI r7, 340
LDI r8, 78
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 393
LDI r11, 201
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
