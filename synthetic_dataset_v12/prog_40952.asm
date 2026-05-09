; DESCRIPTION: Renders a black box of size 89x28 starting at (246, 223).
; PLAN: r0=246(x), r1=223(y), r2=89(width), r3=28(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 223
LDI r2, 89
LDI r3, 28
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
