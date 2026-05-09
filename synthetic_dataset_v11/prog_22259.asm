; DESCRIPTION: Composite: . Then Renders a red box of size 51x10 starting at (124, 66). Then Renders a green disk with center (197, 123) and radius 52.
; PLAN: r0=124(x), r1=66(y), r2=51(width), r3=10(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=197(x), r1=123(y), r2=52(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a red box of size 51x10 starting at (124, 66).
; PLAN: r0=124(x), r1=66(y), r2=51(width), r3=10(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 66
LDI r2, 51
LDI r3, 10
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a green disk with center (197, 123) and radius 52.
; PLAN: r0=197(x), r1=123(y), r2=52(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 197
LDI r1, 123
LDI r2, 52
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
