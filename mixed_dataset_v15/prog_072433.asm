; DESCRIPTION: Renders a black box of size 79x25 starting at (31, 153).
; PLAN: r0=31(x), r1=153(y), r2=79(width), r3=25(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 153
LDI r2, 79
LDI r3, 25
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
