; DESCRIPTION: Renders a red box of size 105x62 starting at (154, 65).
; PLAN: r0=154(x), r1=65(y), r2=105(width), r3=62(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 65
LDI r2, 105
LDI r3, 62
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
