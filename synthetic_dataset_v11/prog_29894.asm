; DESCRIPTION: Renders a orange box of size 95x21 starting at (97, 127).
; PLAN: r0=97(x), r1=127(y), r2=95(width), r3=21(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 127
LDI r2, 95
LDI r3, 21
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
