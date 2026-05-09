; DESCRIPTION: Renders a blue box of size 94x108 starting at (146, 53).
; PLAN: r0=146(x), r1=53(y), r2=94(width), r3=108(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 53
LDI r2, 94
LDI r3, 108
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
