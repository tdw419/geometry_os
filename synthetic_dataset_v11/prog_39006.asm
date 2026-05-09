; DESCRIPTION: Renders a magenta box of size 33x18 starting at (60, 51).
; PLAN: r0=60(x), r1=51(y), r2=33(width), r3=18(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 51
LDI r2, 33
LDI r3, 18
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
