; DESCRIPTION: Composite: . Then Renders a yellow disk with center (110, 167) and radius 48. Then Creates a yellow rectangular region at (190, 200) spanning 30 by 34 pixels.
; PLAN: r0=110(x), r1=167(y), r2=48(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=190(x), r1=200(y), r2=30(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a yellow disk with center (110, 167) and radius 48.
; PLAN: r0=110(x), r1=167(y), r2=48(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 110
LDI r1, 167
LDI r2, 48
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a yellow rectangular region at (190, 200) spanning 30 by 34 pixels.
; PLAN: r0=190(x), r1=200(y), r2=30(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 200
LDI r2, 30
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
