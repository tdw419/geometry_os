; DESCRIPTION: Renders a black box of size 38x74 starting at (105, 4).
; PLAN: r0=105(x), r1=4(y), r2=38(width), r3=74(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 4
LDI r2, 38
LDI r3, 74
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
