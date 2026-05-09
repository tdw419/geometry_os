; DESCRIPTION: Renders a green box of size 74x24 starting at (50, 78).
; PLAN: r0=50(x), r1=78(y), r2=74(width), r3=24(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 78
LDI r2, 74
LDI r3, 24
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
