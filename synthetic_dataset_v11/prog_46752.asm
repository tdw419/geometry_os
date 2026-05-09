; DESCRIPTION: Renders a orange box of size 37x62 starting at (133, 70).
; PLAN: r0=133(x), r1=70(y), r2=37(width), r3=62(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 70
LDI r2, 37
LDI r3, 62
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
