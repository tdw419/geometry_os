; DESCRIPTION: Renders a black box of size 74x32 starting at (301, 110).
; PLAN: r0=301(x), r1=110(y), r2=74(width), r3=32(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 110
LDI r2, 74
LDI r3, 32
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
