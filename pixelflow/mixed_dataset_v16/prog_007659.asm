; DESCRIPTION: Composite: Places a purple circle of radius 35 at center (383, 85) then Renders a white box of size 70x64 starting at (360, 85) then Places a blue dot at position (370, 27).
; PLAN: r0=383(x), r1=85(y), r2=35(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=360(x), r6=85(y), r7=70(width), r8=64(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=370(x), r11=27(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 383
LDI r1, 85
LDI r2, 35
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 360
LDI r6, 85
LDI r7, 70
LDI r8, 64
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 370
LDI r11, 27
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
