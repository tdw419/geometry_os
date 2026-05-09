; DESCRIPTION: Renders a orange box of size 110x25 starting at (94, 110).
; PLAN: r0=94(x), r1=110(y), r2=110(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 110
LDI r2, 110
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
