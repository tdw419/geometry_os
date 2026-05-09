; DESCRIPTION: Composite: . Then Renders a cyan box of size 68x110 starting at (144, 46). Then Renders a purple disk with center (136, 139) and radius 64.
; PLAN: r0=144(x), r1=46(y), r2=68(width), r3=110(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=136(x), r1=139(y), r2=64(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a cyan box of size 68x110 starting at (144, 46).
; PLAN: r0=144(x), r1=46(y), r2=68(width), r3=110(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 46
LDI r2, 68
LDI r3, 110
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a purple disk with center (136, 139) and radius 64.
; PLAN: r0=136(x), r1=139(y), r2=64(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 139
LDI r2, 64
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
