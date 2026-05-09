; DESCRIPTION: Renders a orange box of size 98x55 starting at (123, 95).
; PLAN: r0=123(x), r1=95(y), r2=98(width), r3=55(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 95
LDI r2, 98
LDI r3, 55
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
