; DESCRIPTION: Renders a yellow box of size 55x11 starting at (79, 49).
; PLAN: r0=79(x), r1=49(y), r2=55(width), r3=11(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 49
LDI r2, 55
LDI r3, 11
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
