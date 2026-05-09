; DESCRIPTION: Renders a orange box of size 50x104 starting at (250, 114).
; PLAN: r0=250(x), r1=114(y), r2=50(width), r3=104(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 114
LDI r2, 50
LDI r3, 104
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
