; DESCRIPTION: Renders a green box of size 11x50 starting at (472, 12).
; PLAN: r0=472(x), r1=12(y), r2=11(width), r3=50(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 12
LDI r2, 11
LDI r3, 50
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
