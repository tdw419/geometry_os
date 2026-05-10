; DESCRIPTION: Composite: Renders a cyan disk with center (317, 69) and radius 48 then Places a white line segment connecting (162, 85) to (360, 86) then Sets a single red pixel at (7, 198).
; PLAN: r0=317(x), r1=69(y), r2=48(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=162(x1), r6=85(y1), r7=360(x2), r8=86(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=7(x), r11=198(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 317
LDI r1, 69
LDI r2, 48
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 162
LDI r6, 85
LDI r7, 360
LDI r8, 86
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 7
LDI r11, 198
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
