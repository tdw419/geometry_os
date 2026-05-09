; DESCRIPTION: Renders a orange box of size 100x83 starting at (235, 54).
; PLAN: r0=235(x), r1=54(y), r2=100(width), r3=83(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 54
LDI r2, 100
LDI r3, 83
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
