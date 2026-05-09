; DESCRIPTION: Renders a green box of size 54x36 starting at (5, 43).
; PLAN: r0=5(x), r1=43(y), r2=54(width), r3=36(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 43
LDI r2, 54
LDI r3, 36
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
