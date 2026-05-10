; DESCRIPTION: Renders a yellow box of size 23x64 starting at (106, 136).
; PLAN: r0=106(x), r1=136(y), r2=23(width), r3=64(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 136
LDI r2, 23
LDI r3, 64
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
