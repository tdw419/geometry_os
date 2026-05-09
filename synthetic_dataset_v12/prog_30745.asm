; DESCRIPTION: Renders a blue box of size 83x26 starting at (331, 19).
; PLAN: r0=331(x), r1=19(y), r2=83(width), r3=26(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 19
LDI r2, 83
LDI r3, 26
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
