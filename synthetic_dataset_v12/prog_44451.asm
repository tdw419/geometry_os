; DESCRIPTION: Renders a cyan box of size 49x89 starting at (148, 119).
; PLAN: r0=148(x), r1=119(y), r2=49(width), r3=89(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 119
LDI r2, 49
LDI r3, 89
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
