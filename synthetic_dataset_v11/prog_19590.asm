; DESCRIPTION: Composite: . Then Renders a purple box of size 58x49 starting at (88, 163). Then Renders a white line between points (213, 148) and (137, 172).
; PLAN: r0=88(x), r1=163(y), r2=58(width), r3=49(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=213(x1), r1=148(y1), r2=137(x2), r3=172(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a purple box of size 58x49 starting at (88, 163).
; PLAN: r0=88(x), r1=163(y), r2=58(width), r3=49(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 163
LDI r2, 58
LDI r3, 49
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a white line between points (213, 148) and (137, 172).
; PLAN: r0=213(x1), r1=148(y1), r2=137(x2), r3=172(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 148
LDI r2, 137
LDI r3, 172
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
