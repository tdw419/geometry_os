; DESCRIPTION: Composite: Renders a green box of size 110x81 starting at (82, 59) then Places a blue dot at position (401, 2) then Renders a white disk with center (482, 184) and radius 10.
; PLAN: r0=82(x), r1=59(y), r2=110(width), r3=81(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=401(x), r6=2(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=482(x), r11=184(y), r12=10(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 82
LDI r1, 59
LDI r2, 110
LDI r3, 81
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 401
LDI r6, 2
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 482
LDI r11, 184
LDI r12, 10
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
