; DESCRIPTION: Composite: Renders a purple disk with center (150, 100) and radius 70 then Draws a cyan line from (189, 120) to (94, 255) then Places a orange dot at position (485, 234).
; PLAN: r0=150(x), r1=100(y), r2=70(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=189(x1), r6=120(y1), r7=94(x2), r8=255(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=485(x), r11=234(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 150
LDI r1, 100
LDI r2, 70
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 189
LDI r6, 120
LDI r7, 94
LDI r8, 255
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 485
LDI r11, 234
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
