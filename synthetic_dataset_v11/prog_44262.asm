; DESCRIPTION: Renders a yellow box of size 113x35 starting at (80, 2).
; PLAN: r0=80(x), r1=2(y), r2=113(width), r3=35(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 2
LDI r2, 113
LDI r3, 35
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
