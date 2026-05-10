; DESCRIPTION: Renders a yellow box of size 114x11 starting at (300, 72).
; PLAN: r0=300(x), r1=72(y), r2=114(width), r3=11(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 72
LDI r2, 114
LDI r3, 11
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
