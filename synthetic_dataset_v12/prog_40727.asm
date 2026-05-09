; DESCRIPTION: Renders a orange box of size 113x119 starting at (163, 16).
; PLAN: r0=163(x), r1=16(y), r2=113(width), r3=119(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 16
LDI r2, 113
LDI r3, 119
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
