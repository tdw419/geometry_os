; DESCRIPTION: Renders a white box of size 45x108 starting at (151, 99).
; PLAN: r0=151(x), r1=99(y), r2=45(width), r3=108(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 99
LDI r2, 45
LDI r3, 108
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
