; DESCRIPTION: Renders a blue rectangular region spanning 75 by 71 at (365, 191).
; PLAN: r0=365(x), r1=191(y), r2=75(width), r3=71(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 191
LDI r2, 75
LDI r3, 71
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
