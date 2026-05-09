; DESCRIPTION: Renders a blue box of size 79x45 starting at (131, 159).
; PLAN: r0=131(x), r1=159(y), r2=79(width), r3=45(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 159
LDI r2, 79
LDI r3, 45
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
