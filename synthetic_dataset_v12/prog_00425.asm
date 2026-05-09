; DESCRIPTION: Renders a yellow box of size 24x73 starting at (76, 63).
; PLAN: r0=76(x), r1=63(y), r2=24(width), r3=73(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 63
LDI r2, 24
LDI r3, 73
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
