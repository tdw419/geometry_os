; DESCRIPTION: Renders a blue box of size 71x11 starting at (351, 108).
; PLAN: r0=351(x), r1=108(y), r2=71(width), r3=11(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 108
LDI r2, 71
LDI r3, 11
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
