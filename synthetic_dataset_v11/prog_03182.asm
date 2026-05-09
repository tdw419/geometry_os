; DESCRIPTION: Renders a yellow box of size 33x49 starting at (155, 16).
; PLAN: r0=155(x), r1=16(y), r2=33(width), r3=49(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 16
LDI r2, 33
LDI r3, 49
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
