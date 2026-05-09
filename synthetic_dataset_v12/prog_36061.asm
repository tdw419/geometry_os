; DESCRIPTION: Renders a orange box of size 52x38 starting at (70, 85).
; PLAN: r0=70(x), r1=85(y), r2=52(width), r3=38(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 85
LDI r2, 52
LDI r3, 38
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
