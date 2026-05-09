; DESCRIPTION: Renders a green box of size 95x36 starting at (19, 3).
; PLAN: r0=19(x), r1=3(y), r2=95(width), r3=36(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 3
LDI r2, 95
LDI r3, 36
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
