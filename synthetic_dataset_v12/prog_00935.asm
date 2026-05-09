; DESCRIPTION: Renders a orange box of size 98x29 starting at (179, 179).
; PLAN: r0=179(x), r1=179(y), r2=98(width), r3=29(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 179
LDI r2, 98
LDI r3, 29
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
