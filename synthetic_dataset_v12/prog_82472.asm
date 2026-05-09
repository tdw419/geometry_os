; DESCRIPTION: Renders a black box of size 33x68 starting at (193, 35).
; PLAN: r0=193(x), r1=35(y), r2=33(width), r3=68(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 35
LDI r2, 33
LDI r3, 68
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
