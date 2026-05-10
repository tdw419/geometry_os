; DESCRIPTION: Renders a black box of size 87x97 starting at (389, 124).
; PLAN: r0=389(x), r1=124(y), r2=87(width), r3=97(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 124
LDI r2, 87
LDI r3, 97
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
