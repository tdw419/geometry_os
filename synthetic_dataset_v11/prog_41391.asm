; DESCRIPTION: Composite: . Then Places a black circle of radius 51 at center (95, 51). Then Renders a magenta box of size 25x65 starting at (158, 157).
; PLAN: r0=95(x), r1=51(y), r2=51(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=158(x), r1=157(y), r2=25(width), r3=65(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black circle of radius 51 at center (95, 51).
; PLAN: r0=95(x), r1=51(y), r2=51(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 95
LDI r1, 51
LDI r2, 51
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a magenta box of size 25x65 starting at (158, 157).
; PLAN: r0=158(x), r1=157(y), r2=25(width), r3=65(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 157
LDI r2, 25
LDI r3, 65
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
