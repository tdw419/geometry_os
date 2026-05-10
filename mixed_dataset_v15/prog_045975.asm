; DESCRIPTION: Composite: Renders a cyan disk with center (440, 200) and radius 45 then Renders a magenta box of size 115x105 starting at (318, 67).
; PLAN: r0=440(x), r1=200(y), r2=45(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=318(x), r6=67(y), r7=115(width), r8=105(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 440
LDI r1, 200
LDI r2, 45
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 318
LDI r6, 67
LDI r7, 115
LDI r8, 105
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
