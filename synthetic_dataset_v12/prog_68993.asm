; DESCRIPTION: Renders a red box of size 42x35 starting at (149, 183).
; PLAN: r0=149(x), r1=183(y), r2=42(width), r3=35(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 183
LDI r2, 42
LDI r3, 35
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
