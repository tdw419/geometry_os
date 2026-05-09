; DESCRIPTION: Renders a yellow box of size 68x11 starting at (0, 99).
; PLAN: r0=0(x), r1=99(y), r2=68(width), r3=11(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 99
LDI r2, 68
LDI r3, 11
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
