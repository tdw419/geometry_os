; DESCRIPTION: Renders a green box of size 101x76 starting at (97, 7).
; PLAN: r0=97(x), r1=7(y), r2=101(width), r3=76(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 7
LDI r2, 101
LDI r3, 76
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
