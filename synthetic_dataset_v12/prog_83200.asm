; DESCRIPTION: Renders a orange box of size 56x70 starting at (123, 149).
; PLAN: r0=123(x), r1=149(y), r2=56(width), r3=70(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 149
LDI r2, 56
LDI r3, 70
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
