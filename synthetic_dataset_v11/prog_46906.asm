; DESCRIPTION: Renders a orange box of size 98x78 starting at (133, 153).
; PLAN: r0=133(x), r1=153(y), r2=98(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 153
LDI r2, 98
LDI r3, 78
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
