; DESCRIPTION: Renders a magenta box of size 51x103 starting at (103, 33).
; PLAN: r0=103(x), r1=33(y), r2=51(width), r3=103(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 33
LDI r2, 51
LDI r3, 103
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
