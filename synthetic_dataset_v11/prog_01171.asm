; DESCRIPTION: Renders a green box of size 70x81 starting at (83, 26).
; PLAN: r0=83(x), r1=26(y), r2=70(width), r3=81(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 26
LDI r2, 70
LDI r3, 81
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
