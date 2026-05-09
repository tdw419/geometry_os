; DESCRIPTION: Renders a orange box of size 79x85 starting at (124, 115).
; PLAN: r0=124(x), r1=115(y), r2=79(width), r3=85(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 115
LDI r2, 79
LDI r3, 85
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
