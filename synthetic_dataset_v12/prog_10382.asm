; DESCRIPTION: Composite: Places a red circle of radius 20 at center (462, 145) then Places a blue 56x68 rectangle at position (98, 106) then Places a orange dot at position (262, 5).
; PLAN: r0=462(x), r1=145(y), r2=20(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=98(x), r6=106(y), r7=56(width), r8=68(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=262(x), r11=5(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 462
LDI r1, 145
LDI r2, 20
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 98
LDI r6, 106
LDI r7, 56
LDI r8, 68
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 262
LDI r11, 5
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
