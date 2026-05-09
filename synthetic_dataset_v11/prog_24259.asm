; DESCRIPTION: Composite: . Then Renders a purple line between points (163, 135) and (137, 118). Then Creates a green rectangular region at (20, 95) spanning 92 by 102 pixels.
; PLAN: r0=163(x1), r1=135(y1), r2=137(x2), r3=118(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=20(x), r1=95(y), r2=92(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a purple line between points (163, 135) and (137, 118).
; PLAN: r0=163(x1), r1=135(y1), r2=137(x2), r3=118(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 135
LDI r2, 137
LDI r3, 118
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a green rectangular region at (20, 95) spanning 92 by 102 pixels.
; PLAN: r0=20(x), r1=95(y), r2=92(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 95
LDI r2, 92
LDI r3, 102
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
