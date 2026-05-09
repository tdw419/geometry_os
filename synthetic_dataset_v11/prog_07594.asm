; DESCRIPTION: Composite: . Then Renders a red line between points (67, 24) and (148, 185). Then Creates a yellow rectangular region at (198, 59) spanning 51 by 25 pixels.
; PLAN: r0=67(x1), r1=24(y1), r2=148(x2), r3=185(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=198(x), r1=59(y), r2=51(width), r3=25(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a red line between points (67, 24) and (148, 185).
; PLAN: r0=67(x1), r1=24(y1), r2=148(x2), r3=185(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 24
LDI r2, 148
LDI r3, 185
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a yellow rectangular region at (198, 59) spanning 51 by 25 pixels.
; PLAN: r0=198(x), r1=59(y), r2=51(width), r3=25(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 59
LDI r2, 51
LDI r3, 25
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
