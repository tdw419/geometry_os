; DESCRIPTION: Renders a yellow box of size 53x119 starting at (120, 135).
; PLAN: r0=120(x), r1=135(y), r2=53(width), r3=119(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 135
LDI r2, 53
LDI r3, 119
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
