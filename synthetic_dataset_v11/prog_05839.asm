; DESCRIPTION: Composite: . Then Creates a yellow rectangular region at (90, 160) spanning 20 by 87 pixels. Then Renders a green disk with center (155, 56) and radius 54.
; PLAN: r0=90(x), r1=160(y), r2=20(width), r3=87(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=155(x), r1=56(y), r2=54(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a yellow rectangular region at (90, 160) spanning 20 by 87 pixels.
; PLAN: r0=90(x), r1=160(y), r2=20(width), r3=87(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 160
LDI r2, 20
LDI r3, 87
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a green disk with center (155, 56) and radius 54.
; PLAN: r0=155(x), r1=56(y), r2=54(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 155
LDI r1, 56
LDI r2, 54
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
