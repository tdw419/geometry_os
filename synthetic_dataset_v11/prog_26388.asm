; DESCRIPTION: Renders a green box of size 100x62 starting at (95, 126).
; PLAN: r0=95(x), r1=126(y), r2=100(width), r3=62(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 126
LDI r2, 100
LDI r3, 62
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
