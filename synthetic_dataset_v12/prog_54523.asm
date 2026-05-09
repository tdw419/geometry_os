; DESCRIPTION: Renders a yellow box of size 11x44 starting at (258, 95).
; PLAN: r0=258(x), r1=95(y), r2=11(width), r3=44(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 95
LDI r2, 11
LDI r3, 44
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
