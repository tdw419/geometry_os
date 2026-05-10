; DESCRIPTION: Renders a orange box of size 97x18 starting at (276, 95).
; PLAN: r0=276(x), r1=95(y), r2=97(width), r3=18(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 95
LDI r2, 97
LDI r3, 18
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
