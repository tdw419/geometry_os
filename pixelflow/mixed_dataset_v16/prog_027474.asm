; DESCRIPTION: Composite: Places a orange 99x85 rectangle at position (158, 88) then Renders a cyan disk with center (193, 78) and radius 35.
; PLAN: r0=158(x), r1=88(y), r2=99(width), r3=85(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=193(x), r6=78(y), r7=35(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 158
LDI r1, 88
LDI r2, 99
LDI r3, 85
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 193
LDI r6, 78
LDI r7, 35
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
