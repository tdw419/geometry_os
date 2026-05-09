; DESCRIPTION: Renders a orange box of size 104x81 starting at (141, 34).
; PLAN: r0=141(x), r1=34(y), r2=104(width), r3=81(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 34
LDI r2, 104
LDI r3, 81
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
