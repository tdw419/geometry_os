; DESCRIPTION: Renders a blue box of size 82x89 starting at (408, 131).
; PLAN: r0=408(x), r1=131(y), r2=82(width), r3=89(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 131
LDI r2, 82
LDI r3, 89
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
