; DESCRIPTION: Composite: Renders a orange box of size 12x114 starting at (462, 54) then Renders a cyan disk with center (83, 120) and radius 42.
; PLAN: r0=462(x), r1=54(y), r2=12(width), r3=114(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=83(x), r6=120(y), r7=42(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 462
LDI r1, 54
LDI r2, 12
LDI r3, 114
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 83
LDI r6, 120
LDI r7, 42
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
