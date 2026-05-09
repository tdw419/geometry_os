; DESCRIPTION: Composite: . Then Renders a green disk with center (190, 177) and radius 64. Then Creates a purple rectangular region at (157, 115) spanning 96 by 116 pixels.
; PLAN: r0=190(x), r1=177(y), r2=64(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=157(x), r1=115(y), r2=96(width), r3=116(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a green disk with center (190, 177) and radius 64.
; PLAN: r0=190(x), r1=177(y), r2=64(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 190
LDI r1, 177
LDI r2, 64
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a purple rectangular region at (157, 115) spanning 96 by 116 pixels.
; PLAN: r0=157(x), r1=115(y), r2=96(width), r3=116(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 115
LDI r2, 96
LDI r3, 116
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
