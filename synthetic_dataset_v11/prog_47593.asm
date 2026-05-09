; DESCRIPTION: Renders a yellow box of size 52x12 starting at (181, 29).
; PLAN: r0=181(x), r1=29(y), r2=52(width), r3=12(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 29
LDI r2, 52
LDI r3, 12
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
