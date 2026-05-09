; DESCRIPTION: Renders a yellow box of size 80x103 starting at (145, 2).
; PLAN: r0=145(x), r1=2(y), r2=80(width), r3=103(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 2
LDI r2, 80
LDI r3, 103
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
