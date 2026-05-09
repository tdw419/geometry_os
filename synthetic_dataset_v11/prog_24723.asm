; DESCRIPTION: Composite: . Then Renders a green disk with center (99, 71) and radius 49. Then Renders a yellow box of size 43x51 starting at (90, 5).
; PLAN: r0=99(x), r1=71(y), r2=49(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=90(x), r1=5(y), r2=43(width), r3=51(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a green disk with center (99, 71) and radius 49.
; PLAN: r0=99(x), r1=71(y), r2=49(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 99
LDI r1, 71
LDI r2, 49
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a yellow box of size 43x51 starting at (90, 5).
; PLAN: r0=90(x), r1=5(y), r2=43(width), r3=51(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 5
LDI r2, 43
LDI r3, 51
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
