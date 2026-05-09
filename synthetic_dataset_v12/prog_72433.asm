; DESCRIPTION: Renders a orange box of size 36x46 starting at (117, 35).
; PLAN: r0=117(x), r1=35(y), r2=36(width), r3=46(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 35
LDI r2, 36
LDI r3, 46
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
