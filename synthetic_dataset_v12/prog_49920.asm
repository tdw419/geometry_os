; DESCRIPTION: Renders a yellow box of size 80x31 starting at (132, 59).
; PLAN: r0=132(x), r1=59(y), r2=80(width), r3=31(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 59
LDI r2, 80
LDI r3, 31
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
