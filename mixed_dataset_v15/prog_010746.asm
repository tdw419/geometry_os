; DESCRIPTION: Renders a yellow box of size 31x79 starting at (170, 115).
; PLAN: r0=170(x), r1=115(y), r2=31(width), r3=79(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 115
LDI r2, 31
LDI r3, 79
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
