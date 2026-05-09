; DESCRIPTION: Renders a black box of size 20x83 starting at (265, 161).
; PLAN: r0=265(x), r1=161(y), r2=20(width), r3=83(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 161
LDI r2, 20
LDI r3, 83
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
