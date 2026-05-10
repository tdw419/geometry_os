; DESCRIPTION: Renders a black box of size 102x65 starting at (359, 75).
; PLAN: r0=359(x), r1=75(y), r2=102(width), r3=65(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 75
LDI r2, 102
LDI r3, 65
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
