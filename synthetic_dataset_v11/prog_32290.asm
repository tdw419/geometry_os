; DESCRIPTION: Composite: . Then Creates a black rectangular region at (61, 73) spanning 53 by 66 pixels. Then Renders a black line between points (250, 90) and (124, 191).
; PLAN: r0=61(x), r1=73(y), r2=53(width), r3=66(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=250(x1), r1=90(y1), r2=124(x2), r3=191(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a black rectangular region at (61, 73) spanning 53 by 66 pixels.
; PLAN: r0=61(x), r1=73(y), r2=53(width), r3=66(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 73
LDI r2, 53
LDI r3, 66
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a black line between points (250, 90) and (124, 191).
; PLAN: r0=250(x1), r1=90(y1), r2=124(x2), r3=191(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 90
LDI r2, 124
LDI r3, 191
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
