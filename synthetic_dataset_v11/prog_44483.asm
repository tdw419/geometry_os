; DESCRIPTION: Renders a black box of size 26x74 starting at (205, 120).
; PLAN: r0=205(x), r1=120(y), r2=26(width), r3=74(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 120
LDI r2, 26
LDI r3, 74
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
