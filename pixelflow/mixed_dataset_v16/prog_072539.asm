; DESCRIPTION: Renders a green box of size 59x101 starting at (352, 52).
; PLAN: r0=352(x), r1=52(y), r2=59(width), r3=101(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 52
LDI r2, 59
LDI r3, 101
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
