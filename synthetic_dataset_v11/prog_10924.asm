; DESCRIPTION: Renders a yellow box of size 99x69 starting at (44, 144).
; PLAN: r0=44(x), r1=144(y), r2=99(width), r3=69(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 144
LDI r2, 99
LDI r3, 69
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
