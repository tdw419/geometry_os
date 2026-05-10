; DESCRIPTION: Renders a blue box of size 71x93 starting at (321, 124).
; PLAN: r0=321(x), r1=124(y), r2=71(width), r3=93(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 124
LDI r2, 71
LDI r3, 93
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
