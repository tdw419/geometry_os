; DESCRIPTION: Renders a cyan box of size 81x119 starting at (55, 11).
; PLAN: r0=55(x), r1=11(y), r2=81(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 11
LDI r2, 81
LDI r3, 119
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
