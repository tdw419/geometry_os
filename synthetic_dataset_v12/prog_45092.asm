; DESCRIPTION: Renders a purple box of size 33x48 starting at (81, 66).
; PLAN: r0=81(x), r1=66(y), r2=33(width), r3=48(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 66
LDI r2, 33
LDI r3, 48
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
