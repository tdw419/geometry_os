; DESCRIPTION: Renders a yellow box of size 105x82 starting at (204, 65).
; PLAN: r0=204(x), r1=65(y), r2=105(width), r3=82(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 65
LDI r2, 105
LDI r3, 82
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
