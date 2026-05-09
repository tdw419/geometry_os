; DESCRIPTION: Renders a yellow box of size 112x35 starting at (79, 130).
; PLAN: r0=79(x), r1=130(y), r2=112(width), r3=35(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 130
LDI r2, 112
LDI r3, 35
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
