; DESCRIPTION: Composite: . Then Renders a black disk with center (135, 203) and radius 46. Then Creates a magenta rectangular region at (29, 137) spanning 118 by 55 pixels.
; PLAN: r0=135(x), r1=203(y), r2=46(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=29(x), r1=137(y), r2=118(width), r3=55(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a black disk with center (135, 203) and radius 46.
; PLAN: r0=135(x), r1=203(y), r2=46(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 135
LDI r1, 203
LDI r2, 46
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a magenta rectangular region at (29, 137) spanning 118 by 55 pixels.
; PLAN: r0=29(x), r1=137(y), r2=118(width), r3=55(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 137
LDI r2, 118
LDI r3, 55
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
