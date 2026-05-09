; DESCRIPTION: Composite: . Then Renders a purple disk with center (171, 78) and radius 72. Then Creates a yellow rectangular region at (118, 29) spanning 116 by 111 pixels.
; PLAN: r0=171(x), r1=78(y), r2=72(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=118(x), r1=29(y), r2=116(width), r3=111(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a purple disk with center (171, 78) and radius 72.
; PLAN: r0=171(x), r1=78(y), r2=72(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 171
LDI r1, 78
LDI r2, 72
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a yellow rectangular region at (118, 29) spanning 116 by 111 pixels.
; PLAN: r0=118(x), r1=29(y), r2=116(width), r3=111(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 29
LDI r2, 116
LDI r3, 111
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
