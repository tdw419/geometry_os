; DESCRIPTION: Renders a green box of size 59x106 starting at (69, 84).
; PLAN: r0=69(x), r1=84(y), r2=59(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 84
LDI r2, 59
LDI r3, 106
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
