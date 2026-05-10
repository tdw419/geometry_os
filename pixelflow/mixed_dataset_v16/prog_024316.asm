; DESCRIPTION: Renders a yellow box of size 33x78 starting at (113, 14).
; PLAN: r0=113(x), r1=14(y), r2=33(width), r3=78(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 14
LDI r2, 33
LDI r3, 78
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
