; DESCRIPTION: Renders a orange box of size 108x104 starting at (119, 61).
; PLAN: r0=119(x), r1=61(y), r2=108(width), r3=104(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 61
LDI r2, 108
LDI r3, 104
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
