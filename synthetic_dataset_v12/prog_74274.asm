; DESCRIPTION: Renders a orange box of size 89x89 starting at (366, 94).
; PLAN: r0=366(x), r1=94(y), r2=89(width), r3=89(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 94
LDI r2, 89
LDI r3, 89
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
