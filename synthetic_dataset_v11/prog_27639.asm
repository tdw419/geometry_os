; DESCRIPTION: Composite: . Then Creates a green rectangular region at (62, 128) spanning 118 by 83 pixels. Then Renders a purple disk with center (93, 190) and radius 54.
; PLAN: r0=62(x), r1=128(y), r2=118(width), r3=83(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=93(x), r1=190(y), r2=54(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a green rectangular region at (62, 128) spanning 118 by 83 pixels.
; PLAN: r0=62(x), r1=128(y), r2=118(width), r3=83(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 128
LDI r2, 118
LDI r3, 83
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a purple disk with center (93, 190) and radius 54.
; PLAN: r0=93(x), r1=190(y), r2=54(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 93
LDI r1, 190
LDI r2, 54
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
