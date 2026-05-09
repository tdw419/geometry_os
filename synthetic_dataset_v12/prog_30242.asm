; DESCRIPTION: Renders a yellow box of size 100x91 starting at (127, 119).
; PLAN: r0=127(x), r1=119(y), r2=100(width), r3=91(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 119
LDI r2, 100
LDI r3, 91
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
