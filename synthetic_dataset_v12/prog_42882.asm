; DESCRIPTION: Renders a blue box of size 82x31 starting at (118, 89).
; PLAN: r0=118(x), r1=89(y), r2=82(width), r3=31(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 89
LDI r2, 82
LDI r3, 31
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
