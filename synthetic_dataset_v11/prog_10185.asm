; DESCRIPTION: Composite: . Then Renders a purple box of size 101x91 starting at (5, 161). Then Renders a purple line between points (19, 251) and (116, 58).
; PLAN: r0=5(x), r1=161(y), r2=101(width), r3=91(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=19(x1), r1=251(y1), r2=116(x2), r3=58(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a purple box of size 101x91 starting at (5, 161).
; PLAN: r0=5(x), r1=161(y), r2=101(width), r3=91(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 161
LDI r2, 101
LDI r3, 91
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a purple line between points (19, 251) and (116, 58).
; PLAN: r0=19(x1), r1=251(y1), r2=116(x2), r3=58(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 251
LDI r2, 116
LDI r3, 58
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
