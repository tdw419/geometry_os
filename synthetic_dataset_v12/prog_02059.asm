; DESCRIPTION: Renders a black box of size 80x116 starting at (334, 126).
; PLAN: r0=334(x), r1=126(y), r2=80(width), r3=116(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 126
LDI r2, 80
LDI r3, 116
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
