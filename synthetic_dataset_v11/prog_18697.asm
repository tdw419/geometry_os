; DESCRIPTION: Composite: . Then Renders a purple box of size 47x65 starting at (151, 80). Then Renders a red disk with center (163, 94) and radius 50.
; PLAN: r0=151(x), r1=80(y), r2=47(width), r3=65(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=163(x), r1=94(y), r2=50(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a purple box of size 47x65 starting at (151, 80).
; PLAN: r0=151(x), r1=80(y), r2=47(width), r3=65(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 80
LDI r2, 47
LDI r3, 65
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a red disk with center (163, 94) and radius 50.
; PLAN: r0=163(x), r1=94(y), r2=50(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 163
LDI r1, 94
LDI r2, 50
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
