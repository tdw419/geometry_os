; DESCRIPTION: Renders a green box of size 35x83 starting at (325, 61).
; PLAN: r0=325(x), r1=61(y), r2=35(width), r3=83(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 61
LDI r2, 35
LDI r3, 83
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
