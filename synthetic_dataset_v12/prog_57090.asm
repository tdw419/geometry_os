; DESCRIPTION: Renders a green box of size 71x107 starting at (71, 145).
; PLAN: r0=71(x), r1=145(y), r2=71(width), r3=107(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 145
LDI r2, 71
LDI r3, 107
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
