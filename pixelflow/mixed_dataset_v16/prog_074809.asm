; DESCRIPTION: Renders a orange box of size 89x116 starting at (14, 50).
; PLAN: r0=14(x), r1=50(y), r2=89(width), r3=116(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 50
LDI r2, 89
LDI r3, 116
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
