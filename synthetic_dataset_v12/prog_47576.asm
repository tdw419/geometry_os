; DESCRIPTION: Renders a blue box of size 73x107 starting at (437, 66).
; PLAN: r0=437(x), r1=66(y), r2=73(width), r3=107(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 66
LDI r2, 73
LDI r3, 107
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
