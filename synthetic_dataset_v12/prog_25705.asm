; DESCRIPTION: Renders a blue box of size 102x44 starting at (51, 139).
; PLAN: r0=51(x), r1=139(y), r2=102(width), r3=44(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 139
LDI r2, 102
LDI r3, 44
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
