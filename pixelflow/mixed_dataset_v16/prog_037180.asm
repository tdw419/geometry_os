; DESCRIPTION: Renders a blue box of size 58x82 starting at (288, 58).
; PLAN: r0=288(x), r1=58(y), r2=58(width), r3=82(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 58
LDI r2, 58
LDI r3, 82
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
