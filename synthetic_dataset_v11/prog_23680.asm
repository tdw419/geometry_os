; DESCRIPTION: Composite: . Then Places a purple line segment connecting (61, 134) to (238, 17). Then Renders a purple box of size 82x35 starting at (160, 201).
; PLAN: r0=61(x1), r1=134(y1), r2=238(x2), r3=17(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=160(x), r1=201(y), r2=82(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a purple line segment connecting (61, 134) to (238, 17).
; PLAN: r0=61(x1), r1=134(y1), r2=238(x2), r3=17(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 134
LDI r2, 238
LDI r3, 17
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a purple box of size 82x35 starting at (160, 201).
; PLAN: r0=160(x), r1=201(y), r2=82(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 201
LDI r2, 82
LDI r3, 35
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
