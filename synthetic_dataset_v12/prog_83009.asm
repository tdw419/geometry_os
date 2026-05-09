; DESCRIPTION: Renders a black box of size 11x95 starting at (438, 61).
; PLAN: r0=438(x), r1=61(y), r2=11(width), r3=95(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 61
LDI r2, 11
LDI r3, 95
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
