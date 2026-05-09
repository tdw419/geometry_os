; DESCRIPTION: Renders a green box of size 50x36 starting at (52, 100).
; PLAN: r0=52(x), r1=100(y), r2=50(width), r3=36(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 100
LDI r2, 50
LDI r3, 36
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
