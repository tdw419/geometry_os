; DESCRIPTION: Renders a blue box of size 61x55 starting at (5, 46).
; PLAN: r0=5(x), r1=46(y), r2=61(width), r3=55(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 46
LDI r2, 61
LDI r3, 55
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
