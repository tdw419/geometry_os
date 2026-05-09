; DESCRIPTION: Renders a orange box of size 24x35 starting at (119, 168).
; PLAN: r0=119(x), r1=168(y), r2=24(width), r3=35(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 168
LDI r2, 24
LDI r3, 35
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
