; DESCRIPTION: Renders a green box of size 105x13 starting at (100, 195).
; PLAN: r0=100(x), r1=195(y), r2=105(width), r3=13(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 195
LDI r2, 105
LDI r3, 13
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
