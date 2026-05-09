; DESCRIPTION: Renders a orange box of size 79x36 starting at (309, 104).
; PLAN: r0=309(x), r1=104(y), r2=79(width), r3=36(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 104
LDI r2, 79
LDI r3, 36
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
