; DESCRIPTION: Renders a orange box of size 119x30 starting at (303, 205).
; PLAN: r0=303(x), r1=205(y), r2=119(width), r3=30(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 205
LDI r2, 119
LDI r3, 30
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
