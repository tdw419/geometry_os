; DESCRIPTION: Renders a blue box of size 94x107 starting at (212, 46).
; PLAN: r0=212(x), r1=46(y), r2=94(width), r3=107(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 46
LDI r2, 94
LDI r3, 107
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
