; DESCRIPTION: Renders a black box of size 61x58 starting at (106, 173).
; PLAN: r0=106(x), r1=173(y), r2=61(width), r3=58(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 173
LDI r2, 61
LDI r3, 58
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
