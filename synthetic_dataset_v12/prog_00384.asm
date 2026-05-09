; DESCRIPTION: Renders a orange box of size 60x97 starting at (251, 137).
; PLAN: r0=251(x), r1=137(y), r2=60(width), r3=97(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 137
LDI r2, 60
LDI r3, 97
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
