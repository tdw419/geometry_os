; DESCRIPTION: Renders a yellow box of size 112x49 starting at (30, 206).
; PLAN: r0=30(x), r1=206(y), r2=112(width), r3=49(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 206
LDI r2, 112
LDI r3, 49
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
