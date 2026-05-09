; DESCRIPTION: Composite: . Then Renders a purple disk with center (198, 71) and radius 21. Then Renders a purple box of size 55x18 starting at (88, 105).
; PLAN: r0=198(x), r1=71(y), r2=21(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=88(x), r1=105(y), r2=55(width), r3=18(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a purple disk with center (198, 71) and radius 21.
; PLAN: r0=198(x), r1=71(y), r2=21(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 198
LDI r1, 71
LDI r2, 21
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a purple box of size 55x18 starting at (88, 105).
; PLAN: r0=88(x), r1=105(y), r2=55(width), r3=18(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 105
LDI r2, 55
LDI r3, 18
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
