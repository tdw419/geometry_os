; DESCRIPTION: Composite: . Then Creates a black rectangular region at (174, 0) spanning 23 by 109 pixels. Then Renders a blue disk with center (113, 203) and radius 22.
; PLAN: r0=174(x), r1=0(y), r2=23(width), r3=109(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=113(x), r1=203(y), r2=22(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a black rectangular region at (174, 0) spanning 23 by 109 pixels.
; PLAN: r0=174(x), r1=0(y), r2=23(width), r3=109(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 0
LDI r2, 23
LDI r3, 109
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a blue disk with center (113, 203) and radius 22.
; PLAN: r0=113(x), r1=203(y), r2=22(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 113
LDI r1, 203
LDI r2, 22
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
