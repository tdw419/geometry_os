; DESCRIPTION: Composite: Renders a white disk with center (156, 90) and radius 26 then Renders a red box of size 72x11 starting at (80, 55) then Sets a single green pixel at (123, 93).
; PLAN: r0=156(x), r1=90(y), r2=26(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=80(x), r6=55(y), r7=72(width), r8=11(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=123(x), r11=93(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 156
LDI r1, 90
LDI r2, 26
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 80
LDI r6, 55
LDI r7, 72
LDI r8, 11
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 123
LDI r11, 93
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
