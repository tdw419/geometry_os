; DESCRIPTION: Renders a orange box of size 62x37 starting at (106, 117).
; PLAN: r0=106(x), r1=117(y), r2=62(width), r3=37(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 117
LDI r2, 62
LDI r3, 37
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
