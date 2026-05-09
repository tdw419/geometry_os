; DESCRIPTION: Renders a yellow box of size 11x111 starting at (293, 66).
; PLAN: r0=293(x), r1=66(y), r2=11(width), r3=111(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 66
LDI r2, 11
LDI r3, 111
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
