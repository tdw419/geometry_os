; DESCRIPTION: Renders a red box of size 13x106 starting at (209, 50).
; PLAN: r0=209(x), r1=50(y), r2=13(width), r3=106(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 50
LDI r2, 13
LDI r3, 106
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
