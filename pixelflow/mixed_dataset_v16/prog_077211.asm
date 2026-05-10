; DESCRIPTION: Renders a yellow box of size 35x69 starting at (72, 87).
; PLAN: r0=72(x), r1=87(y), r2=35(width), r3=69(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 87
LDI r2, 35
LDI r3, 69
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
