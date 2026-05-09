; DESCRIPTION: Renders a red box of size 20x26 starting at (68, 12).
; PLAN: r0=68(x), r1=12(y), r2=20(width), r3=26(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 12
LDI r2, 20
LDI r3, 26
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
