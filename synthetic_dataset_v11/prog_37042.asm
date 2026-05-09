; DESCRIPTION: Renders a orange box of size 104x23 starting at (137, 162).
; PLAN: r0=137(x), r1=162(y), r2=104(width), r3=23(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 162
LDI r2, 104
LDI r3, 23
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
