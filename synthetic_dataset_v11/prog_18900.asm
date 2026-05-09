; DESCRIPTION: Composite: . Then Renders a black line between points (119, 112) and (211, 171). Then Creates a black rectangular region at (60, 7) spanning 59 by 97 pixels.
; PLAN: r0=119(x1), r1=112(y1), r2=211(x2), r3=171(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=60(x), r1=7(y), r2=59(width), r3=97(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a black line between points (119, 112) and (211, 171).
; PLAN: r0=119(x1), r1=112(y1), r2=211(x2), r3=171(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 112
LDI r2, 211
LDI r3, 171
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a black rectangular region at (60, 7) spanning 59 by 97 pixels.
; PLAN: r0=60(x), r1=7(y), r2=59(width), r3=97(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 7
LDI r2, 59
LDI r3, 97
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
