; DESCRIPTION: Renders a black box of size 91x87 starting at (413, 136).
; PLAN: r0=413(x), r1=136(y), r2=91(width), r3=87(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 136
LDI r2, 91
LDI r3, 87
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
