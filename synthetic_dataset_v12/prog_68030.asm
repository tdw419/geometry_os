; DESCRIPTION: Renders a yellow box of size 11x54 starting at (132, 152).
; PLAN: r0=132(x), r1=152(y), r2=11(width), r3=54(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 152
LDI r2, 11
LDI r3, 54
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
