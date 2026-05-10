; DESCRIPTION: Composite: Places a white circle of radius 42 at center (200, 50) then Renders a white box of size 27x38 starting at (395, 149) then Places a blue dot at position (181, 91).
; PLAN: r0=200(x), r1=50(y), r2=42(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=395(x), r6=149(y), r7=27(width), r8=38(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=181(x), r11=91(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 200
LDI r1, 50
LDI r2, 42
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 395
LDI r6, 149
LDI r7, 27
LDI r8, 38
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 181
LDI r11, 91
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
