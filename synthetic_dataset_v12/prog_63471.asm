; DESCRIPTION: Renders a orange box of size 18x79 starting at (117, 23).
; PLAN: r0=117(x), r1=23(y), r2=18(width), r3=79(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 23
LDI r2, 18
LDI r3, 79
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
