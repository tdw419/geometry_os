; DESCRIPTION: Renders a green box of size 37x24 starting at (4, 76).
; PLAN: r0=4(x), r1=76(y), r2=37(width), r3=24(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 76
LDI r2, 37
LDI r3, 24
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
