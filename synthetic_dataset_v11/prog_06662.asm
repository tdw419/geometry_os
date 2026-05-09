; DESCRIPTION: Renders a orange box of size 104x89 starting at (84, 18).
; PLAN: r0=84(x), r1=18(y), r2=104(width), r3=89(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 18
LDI r2, 104
LDI r3, 89
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
