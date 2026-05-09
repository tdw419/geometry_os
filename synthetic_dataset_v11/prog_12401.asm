; DESCRIPTION: Renders a blue box of size 98x103 starting at (131, 149).
; PLAN: r0=131(x), r1=149(y), r2=98(width), r3=103(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 149
LDI r2, 98
LDI r3, 103
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
