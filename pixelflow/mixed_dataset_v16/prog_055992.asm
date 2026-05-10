; DESCRIPTION: Composite: Renders a green box of size 32x113 starting at (398, 84) then Sets a single purple pixel at (145, 240) then Places a white circle of radius 24 at center (367, 94).
; PLAN: r0=398(x), r1=84(y), r2=32(width), r3=113(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=145(x), r6=240(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=367(x), r11=94(y), r12=24(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 398
LDI r1, 84
LDI r2, 32
LDI r3, 113
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 145
LDI r6, 240
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 367
LDI r11, 94
LDI r12, 24
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
