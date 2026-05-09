; DESCRIPTION: Renders a blue box of size 38x48 starting at (377, 149).
; PLAN: r0=377(x), r1=149(y), r2=38(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 149
LDI r2, 38
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
