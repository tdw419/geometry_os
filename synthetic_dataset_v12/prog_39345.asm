; DESCRIPTION: Renders a yellow box of size 99x29 starting at (69, 132).
; PLAN: r0=69(x), r1=132(y), r2=99(width), r3=29(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 132
LDI r2, 99
LDI r3, 29
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
