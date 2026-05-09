; DESCRIPTION: Composite: Places a green 77x63 rectangle at position (135, 31) then Places a blue circle of radius 13 at center (485, 199) then Places a green dot at position (308, 172).
; PLAN: r0=135(x), r1=31(y), r2=77(width), r3=63(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=485(x), r6=199(y), r7=13(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=308(x), r11=172(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 135
LDI r1, 31
LDI r2, 77
LDI r3, 63
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 485
LDI r6, 199
LDI r7, 13
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 308
LDI r11, 172
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
