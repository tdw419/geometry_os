; DESCRIPTION: Renders a orange box of size 55x87 starting at (49, 82).
; PLAN: r0=49(x), r1=82(y), r2=55(width), r3=87(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 82
LDI r2, 55
LDI r3, 87
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
