; DESCRIPTION: Renders a orange box of size 75x46 starting at (117, 34).
; PLAN: r0=117(x), r1=34(y), r2=75(width), r3=46(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 34
LDI r2, 75
LDI r3, 46
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
