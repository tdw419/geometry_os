; DESCRIPTION: Composite: . Then Renders a black box of size 101x99 starting at (62, 51). Then Places a magenta dot at position (125, 196).
; PLAN: r0=62(x), r1=51(y), r2=101(width), r3=99(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=125(x), r1=196(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a black box of size 101x99 starting at (62, 51).
; PLAN: r0=62(x), r1=51(y), r2=101(width), r3=99(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 51
LDI r2, 101
LDI r3, 99
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta dot at position (125, 196).
; PLAN: r0=125(x), r1=196(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 125
LDI r1, 196
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
