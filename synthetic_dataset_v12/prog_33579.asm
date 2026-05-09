; DESCRIPTION: Renders a blue box of size 76x83 starting at (429, 169).
; PLAN: r0=429(x), r1=169(y), r2=76(width), r3=83(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 169
LDI r2, 76
LDI r3, 83
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
