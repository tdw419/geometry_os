; DESCRIPTION: Renders a black box of size 95x48 starting at (324, 9).
; PLAN: r0=324(x), r1=9(y), r2=95(width), r3=48(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 9
LDI r2, 95
LDI r3, 48
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
