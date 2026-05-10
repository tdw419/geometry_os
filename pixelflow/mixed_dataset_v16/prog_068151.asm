; DESCRIPTION: Renders a black box of size 62x77 starting at (389, 35).
; PLAN: r0=389(x), r1=35(y), r2=62(width), r3=77(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 35
LDI r2, 62
LDI r3, 77
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
