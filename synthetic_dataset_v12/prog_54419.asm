; DESCRIPTION: Renders a yellow box of size 47x43 starting at (204, 47).
; PLAN: r0=204(x), r1=47(y), r2=47(width), r3=43(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 47
LDI r2, 47
LDI r3, 43
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
