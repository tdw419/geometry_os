; DESCRIPTION: Renders a blue box of size 31x15 starting at (211, 218).
; PLAN: r0=211(x), r1=218(y), r2=31(width), r3=15(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 218
LDI r2, 31
LDI r3, 15
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
