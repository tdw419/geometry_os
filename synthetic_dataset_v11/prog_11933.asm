; DESCRIPTION: Renders a orange box of size 60x79 starting at (167, 137).
; PLAN: r0=167(x), r1=137(y), r2=60(width), r3=79(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 137
LDI r2, 60
LDI r3, 79
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
