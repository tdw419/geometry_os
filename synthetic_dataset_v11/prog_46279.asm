; DESCRIPTION: Renders a green box of size 78x107 starting at (69, 43).
; PLAN: r0=69(x), r1=43(y), r2=78(width), r3=107(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 43
LDI r2, 78
LDI r3, 107
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
