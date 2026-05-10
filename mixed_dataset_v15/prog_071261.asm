; DESCRIPTION: Composite: Renders a white disk with center (117, 54) and radius 49 then Renders a magenta box of size 45x24 starting at (326, 231).
; PLAN: r0=117(x), r1=54(y), r2=49(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=326(x), r6=231(y), r7=45(width), r8=24(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 117
LDI r1, 54
LDI r2, 49
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 326
LDI r6, 231
LDI r7, 45
LDI r8, 24
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
