; DESCRIPTION: Renders a yellow box of size 84x52 starting at (93, 126).
; PLAN: r0=93(x), r1=126(y), r2=84(width), r3=52(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 126
LDI r2, 84
LDI r3, 52
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
