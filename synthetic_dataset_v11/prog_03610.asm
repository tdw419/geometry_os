; DESCRIPTION: Renders a green box of size 37x107 starting at (172, 85).
; PLAN: r0=172(x), r1=85(y), r2=37(width), r3=107(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 85
LDI r2, 37
LDI r3, 107
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
