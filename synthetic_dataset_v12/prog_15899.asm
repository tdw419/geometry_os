; DESCRIPTION: Renders a yellow box of size 110x43 starting at (73, 113).
; PLAN: r0=73(x), r1=113(y), r2=110(width), r3=43(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 113
LDI r2, 110
LDI r3, 43
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
