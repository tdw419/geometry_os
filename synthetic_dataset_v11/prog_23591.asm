; DESCRIPTION: Composite: . Then Renders a green box of size 66x50 starting at (56, 35). Then Renders a purple disk with center (31, 115) and radius 14.
; PLAN: r0=56(x), r1=35(y), r2=66(width), r3=50(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=31(x), r1=115(y), r2=14(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a green box of size 66x50 starting at (56, 35).
; PLAN: r0=56(x), r1=35(y), r2=66(width), r3=50(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 35
LDI r2, 66
LDI r3, 50
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a purple disk with center (31, 115) and radius 14.
; PLAN: r0=31(x), r1=115(y), r2=14(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 31
LDI r1, 115
LDI r2, 14
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
