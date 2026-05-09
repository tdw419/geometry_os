; DESCRIPTION: Renders a orange box of size 33x104 starting at (266, 85).
; PLAN: r0=266(x), r1=85(y), r2=33(width), r3=104(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 85
LDI r2, 33
LDI r3, 104
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
