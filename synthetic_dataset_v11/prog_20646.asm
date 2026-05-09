; DESCRIPTION: Composite: . Then Renders a purple box of size 49x80 starting at (2, 36). Then Renders a red line between points (247, 191) and (11, 60).
; PLAN: r0=2(x), r1=36(y), r2=49(width), r3=80(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=247(x1), r1=191(y1), r2=11(x2), r3=60(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a purple box of size 49x80 starting at (2, 36).
; PLAN: r0=2(x), r1=36(y), r2=49(width), r3=80(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 36
LDI r2, 49
LDI r3, 80
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a red line between points (247, 191) and (11, 60).
; PLAN: r0=247(x1), r1=191(y1), r2=11(x2), r3=60(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 191
LDI r2, 11
LDI r3, 60
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
