; DESCRIPTION: Composite: . Then Places a magenta 10x51 rectangle at position (135, 137). Then Renders a purple disk with center (111, 49) and radius 46.
; PLAN: r0=135(x), r1=137(y), r2=10(width), r3=51(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=111(x), r1=49(y), r2=46(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a magenta 10x51 rectangle at position (135, 137).
; PLAN: r0=135(x), r1=137(y), r2=10(width), r3=51(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 137
LDI r2, 10
LDI r3, 51
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a purple disk with center (111, 49) and radius 46.
; PLAN: r0=111(x), r1=49(y), r2=46(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 111
LDI r1, 49
LDI r2, 46
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
