; DESCRIPTION: Renders a black box of size 35x85 starting at (311, 60).
; PLAN: r0=311(x), r1=60(y), r2=35(width), r3=85(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 60
LDI r2, 35
LDI r3, 85
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
