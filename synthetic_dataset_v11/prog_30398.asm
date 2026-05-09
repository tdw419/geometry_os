; DESCRIPTION: Renders a orange box of size 108x96 starting at (73, 120).
; PLAN: r0=73(x), r1=120(y), r2=108(width), r3=96(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 120
LDI r2, 108
LDI r3, 96
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
