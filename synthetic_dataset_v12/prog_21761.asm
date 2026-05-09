; DESCRIPTION: Renders a orange box of size 118x70 starting at (139, 116).
; PLAN: r0=139(x), r1=116(y), r2=118(width), r3=70(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 116
LDI r2, 118
LDI r3, 70
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
