; DESCRIPTION: Renders a orange box of size 12x22 starting at (68, 80).
; PLAN: r0=68(x), r1=80(y), r2=12(width), r3=22(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 80
LDI r2, 12
LDI r3, 22
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
