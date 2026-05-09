; DESCRIPTION: Renders a blue box of size 83x98 starting at (33, 79).
; PLAN: r0=33(x), r1=79(y), r2=83(width), r3=98(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 79
LDI r2, 83
LDI r3, 98
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
