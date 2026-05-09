; DESCRIPTION: Renders a yellow box of size 24x29 starting at (126, 137).
; PLAN: r0=126(x), r1=137(y), r2=24(width), r3=29(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 137
LDI r2, 24
LDI r3, 29
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
