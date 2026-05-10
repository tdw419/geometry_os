; DESCRIPTION: Renders a yellow box of size 79x13 starting at (389, 216).
; PLAN: r0=389(x), r1=216(y), r2=79(width), r3=13(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 216
LDI r2, 79
LDI r3, 13
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
