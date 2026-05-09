; DESCRIPTION: Renders a blue box of size 87x11 starting at (391, 184).
; PLAN: r0=391(x), r1=184(y), r2=87(width), r3=11(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 184
LDI r2, 87
LDI r3, 11
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
