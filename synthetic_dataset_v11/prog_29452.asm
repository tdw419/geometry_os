; DESCRIPTION: Renders a yellow box of size 10x90 starting at (227, 79).
; PLAN: r0=227(x), r1=79(y), r2=10(width), r3=90(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 79
LDI r2, 10
LDI r3, 90
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
