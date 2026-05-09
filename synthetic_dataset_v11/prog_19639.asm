; DESCRIPTION: Composite: . Then Renders a yellow line between points (93, 232) and (153, 8). Then Creates a yellow rectangular region at (15, 30) spanning 93 by 66 pixels.
; PLAN: r0=93(x1), r1=232(y1), r2=153(x2), r3=8(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=15(x), r1=30(y), r2=93(width), r3=66(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a yellow line between points (93, 232) and (153, 8).
; PLAN: r0=93(x1), r1=232(y1), r2=153(x2), r3=8(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 232
LDI r2, 153
LDI r3, 8
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a yellow rectangular region at (15, 30) spanning 93 by 66 pixels.
; PLAN: r0=15(x), r1=30(y), r2=93(width), r3=66(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 30
LDI r2, 93
LDI r3, 66
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
