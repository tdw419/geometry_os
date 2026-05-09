; DESCRIPTION: Renders a magenta box of size 51x111 starting at (337, 4).
; PLAN: r0=337(x), r1=4(y), r2=51(width), r3=111(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 4
LDI r2, 51
LDI r3, 111
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
