; DESCRIPTION: Renders a yellow box of size 53x105 starting at (181, 109).
; PLAN: r0=181(x), r1=109(y), r2=53(width), r3=105(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 109
LDI r2, 53
LDI r3, 105
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
