; DESCRIPTION: Renders a orange box of size 116x100 starting at (104, 37).
; PLAN: r0=104(x), r1=37(y), r2=116(width), r3=100(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 37
LDI r2, 116
LDI r3, 100
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
