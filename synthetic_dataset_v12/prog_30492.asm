; DESCRIPTION: Renders a blue box of size 96x45 starting at (266, 108).
; PLAN: r0=266(x), r1=108(y), r2=96(width), r3=45(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 108
LDI r2, 96
LDI r3, 45
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
