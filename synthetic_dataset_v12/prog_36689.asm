; DESCRIPTION: Renders a green box of size 96x25 starting at (134, 26).
; PLAN: r0=134(x), r1=26(y), r2=96(width), r3=25(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 26
LDI r2, 96
LDI r3, 25
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
