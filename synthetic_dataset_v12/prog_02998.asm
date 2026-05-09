; DESCRIPTION: Renders a purple box of size 92x33 starting at (265, 23).
; PLAN: r0=265(x), r1=23(y), r2=92(width), r3=33(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 23
LDI r2, 92
LDI r3, 33
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
