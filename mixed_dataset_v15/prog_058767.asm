; DESCRIPTION: Renders a black box of size 65x98 starting at (60, 78).
; PLAN: r0=60(x), r1=78(y), r2=65(width), r3=98(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 78
LDI r2, 65
LDI r3, 98
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
