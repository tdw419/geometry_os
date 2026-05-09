; DESCRIPTION: Renders a orange box of size 118x29 starting at (110, 117).
; PLAN: r0=110(x), r1=117(y), r2=118(width), r3=29(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 117
LDI r2, 118
LDI r3, 29
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
