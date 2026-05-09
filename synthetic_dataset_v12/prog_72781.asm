; DESCRIPTION: Composite: Draws a cyan rectangle at (89, 13) with width 63 and height 93 then Draws a purple circle centered at (413, 144) with radius 16.
; PLAN: r0=89(x), r1=13(y), r2=63(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=413(x), r6=144(y), r7=16(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 89
LDI r1, 13
LDI r2, 63
LDI r3, 93
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 413
LDI r6, 144
LDI r7, 16
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
