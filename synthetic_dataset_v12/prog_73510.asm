; DESCRIPTION: Renders a black box of size 101x33 starting at (68, 166).
; PLAN: r0=68(x), r1=166(y), r2=101(width), r3=33(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 166
LDI r2, 101
LDI r3, 33
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
