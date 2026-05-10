; DESCRIPTION: Renders a orange box of size 53x79 starting at (361, 133).
; PLAN: r0=361(x), r1=133(y), r2=53(width), r3=79(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 133
LDI r2, 53
LDI r3, 79
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
