; DESCRIPTION: Composite: Places a blue circle of radius 50 at center (66, 115) then Renders a orange box of size 60x117 starting at (254, 106) then Sets a single cyan pixel at (435, 149).
; PLAN: r0=66(x), r1=115(y), r2=50(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=254(x), r6=106(y), r7=60(width), r8=117(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=435(x), r11=149(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 66
LDI r1, 115
LDI r2, 50
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 254
LDI r6, 106
LDI r7, 60
LDI r8, 117
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 435
LDI r11, 149
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
