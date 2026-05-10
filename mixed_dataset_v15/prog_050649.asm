; DESCRIPTION: Renders a orange box of size 104x19 starting at (33, 121).
; PLAN: r0=33(x), r1=121(y), r2=104(width), r3=19(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 121
LDI r2, 104
LDI r3, 19
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
