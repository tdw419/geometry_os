; DESCRIPTION: Renders a green box of size 41x11 starting at (448, 35).
; PLAN: r0=448(x), r1=35(y), r2=41(width), r3=11(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 35
LDI r2, 41
LDI r3, 11
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
