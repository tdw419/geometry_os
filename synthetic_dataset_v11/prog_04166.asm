; DESCRIPTION: Renders a purple box of size 32x55 starting at (149, 131).
; PLAN: r0=149(x), r1=131(y), r2=32(width), r3=55(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 131
LDI r2, 32
LDI r3, 55
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
