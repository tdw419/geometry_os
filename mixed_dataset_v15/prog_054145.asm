; DESCRIPTION: Renders a black box of size 76x74 starting at (276, 126).
; PLAN: r0=276(x), r1=126(y), r2=76(width), r3=74(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 126
LDI r2, 76
LDI r3, 74
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
