; DESCRIPTION: Renders a orange box of size 104x33 starting at (151, 58).
; PLAN: r0=151(x), r1=58(y), r2=104(width), r3=33(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 58
LDI r2, 104
LDI r3, 33
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
