; DESCRIPTION: Composite: Renders a cyan box of size 78x98 starting at (126, 63) then Draws a purple circle centered at (418, 49) with radius 22.
; PLAN: r0=126(x), r1=63(y), r2=78(width), r3=98(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=418(x), r6=49(y), r7=22(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 126
LDI r1, 63
LDI r2, 78
LDI r3, 98
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 418
LDI r6, 49
LDI r7, 22
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
