; DESCRIPTION: Renders a yellow box of size 89x49 starting at (26, 79).
; PLAN: r0=26(x), r1=79(y), r2=89(width), r3=49(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 79
LDI r2, 89
LDI r3, 49
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
