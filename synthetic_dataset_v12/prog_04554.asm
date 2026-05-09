; DESCRIPTION: Renders a orange box of size 104x96 starting at (169, 38).
; PLAN: r0=169(x), r1=38(y), r2=104(width), r3=96(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 38
LDI r2, 104
LDI r3, 96
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
