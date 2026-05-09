; DESCRIPTION: Composite: . Then Renders a blue box of size 85x75 starting at (56, 71). Then Renders a purple disk with center (123, 190) and radius 57.
; PLAN: r0=56(x), r1=71(y), r2=85(width), r3=75(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=123(x), r1=190(y), r2=57(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a blue box of size 85x75 starting at (56, 71).
; PLAN: r0=56(x), r1=71(y), r2=85(width), r3=75(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 71
LDI r2, 85
LDI r3, 75
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a purple disk with center (123, 190) and radius 57.
; PLAN: r0=123(x), r1=190(y), r2=57(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 123
LDI r1, 190
LDI r2, 57
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
