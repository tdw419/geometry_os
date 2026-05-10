; DESCRIPTION: Renders a yellow box of size 57x55 starting at (106, 99).
; PLAN: r0=106(x), r1=99(y), r2=57(width), r3=55(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 99
LDI r2, 57
LDI r3, 55
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
