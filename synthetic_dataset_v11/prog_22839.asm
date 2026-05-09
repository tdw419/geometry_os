; DESCRIPTION: Renders a orange box of size 36x119 starting at (113, 117).
; PLAN: r0=113(x), r1=117(y), r2=36(width), r3=119(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 117
LDI r2, 36
LDI r3, 119
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
