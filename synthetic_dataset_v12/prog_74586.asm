; DESCRIPTION: Renders a white box of size 71x93 starting at (230, 145).
; PLAN: r0=230(x), r1=145(y), r2=71(width), r3=93(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 145
LDI r2, 71
LDI r3, 93
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
