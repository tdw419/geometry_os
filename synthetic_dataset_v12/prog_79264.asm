; DESCRIPTION: Renders a red box of size 42x36 starting at (155, 159).
; PLAN: r0=155(x), r1=159(y), r2=42(width), r3=36(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 159
LDI r2, 42
LDI r3, 36
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
