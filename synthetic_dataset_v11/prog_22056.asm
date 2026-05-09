; DESCRIPTION: Renders a yellow box of size 105x50 starting at (142, 204).
; PLAN: r0=142(x), r1=204(y), r2=105(width), r3=50(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 204
LDI r2, 105
LDI r3, 50
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
