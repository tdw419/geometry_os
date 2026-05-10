; DESCRIPTION: Renders a blue box of size 58x79 starting at (381, 131).
; PLAN: r0=381(x), r1=131(y), r2=58(width), r3=79(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 131
LDI r2, 58
LDI r3, 79
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
