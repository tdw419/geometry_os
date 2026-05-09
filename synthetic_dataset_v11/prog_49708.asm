; DESCRIPTION: Composite: . Then Creates a black rectangular region at (1, 114) spanning 118 by 101 pixels. Then Renders a black line between points (203, 44) and (235, 227).
; PLAN: r0=1(x), r1=114(y), r2=118(width), r3=101(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=203(x1), r1=44(y1), r2=235(x2), r3=227(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a black rectangular region at (1, 114) spanning 118 by 101 pixels.
; PLAN: r0=1(x), r1=114(y), r2=118(width), r3=101(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 114
LDI r2, 118
LDI r3, 101
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a black line between points (203, 44) and (235, 227).
; PLAN: r0=203(x1), r1=44(y1), r2=235(x2), r3=227(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 44
LDI r2, 235
LDI r3, 227
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
