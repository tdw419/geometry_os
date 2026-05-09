; DESCRIPTION: Renders a white box of size 119x83 starting at (98, 72).
; PLAN: r0=98(x), r1=72(y), r2=119(width), r3=83(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 72
LDI r2, 119
LDI r3, 83
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
