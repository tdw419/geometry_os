; DESCRIPTION: Renders a yellow box of size 11x22 starting at (152, 4).
; PLAN: r0=152(x), r1=4(y), r2=11(width), r3=22(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 4
LDI r2, 11
LDI r3, 22
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
