; DESCRIPTION: Renders a black box of size 75x14 starting at (301, 130).
; PLAN: r0=301(x), r1=130(y), r2=75(width), r3=14(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 130
LDI r2, 75
LDI r3, 14
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
