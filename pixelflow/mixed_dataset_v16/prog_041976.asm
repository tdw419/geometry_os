; DESCRIPTION: Renders a black box of size 75x10 starting at (115, 199).
; PLAN: r0=115(x), r1=199(y), r2=75(width), r3=10(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 199
LDI r2, 75
LDI r3, 10
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
