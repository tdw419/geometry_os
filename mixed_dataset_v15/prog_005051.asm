; DESCRIPTION: Renders a green box of size 73x97 starting at (419, 137).
; PLAN: r0=419(x), r1=137(y), r2=73(width), r3=97(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 137
LDI r2, 73
LDI r3, 97
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
