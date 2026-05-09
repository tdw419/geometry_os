; DESCRIPTION: Renders a green box of size 95x19 starting at (88, 8).
; PLAN: r0=88(x), r1=8(y), r2=95(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 8
LDI r2, 95
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
