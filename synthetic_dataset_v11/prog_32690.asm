; DESCRIPTION: Renders a black box of size 24x38 starting at (87, 116).
; PLAN: r0=87(x), r1=116(y), r2=24(width), r3=38(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 116
LDI r2, 24
LDI r3, 38
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
