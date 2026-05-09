; DESCRIPTION: Renders a orange box of size 70x43 starting at (191, 104).
; PLAN: r0=191(x), r1=104(y), r2=70(width), r3=43(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 104
LDI r2, 70
LDI r3, 43
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
