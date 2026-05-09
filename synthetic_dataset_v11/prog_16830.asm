; DESCRIPTION: Composite: . Then Renders a black disk with center (178, 154) and radius 75. Then Renders a purple box of size 54x45 starting at (97, 83).
; PLAN: r0=178(x), r1=154(y), r2=75(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=97(x), r1=83(y), r2=54(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a black disk with center (178, 154) and radius 75.
; PLAN: r0=178(x), r1=154(y), r2=75(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 178
LDI r1, 154
LDI r2, 75
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a purple box of size 54x45 starting at (97, 83).
; PLAN: r0=97(x), r1=83(y), r2=54(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 83
LDI r2, 54
LDI r3, 45
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
