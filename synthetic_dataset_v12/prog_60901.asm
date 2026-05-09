; DESCRIPTION: Renders a orange box of size 114x87 starting at (395, 80).
; PLAN: r0=395(x), r1=80(y), r2=114(width), r3=87(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 80
LDI r2, 114
LDI r3, 87
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
