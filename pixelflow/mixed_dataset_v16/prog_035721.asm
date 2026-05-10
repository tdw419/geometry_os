; DESCRIPTION: Renders a orange box of size 44x75 starting at (74, 135).
; PLAN: r0=74(x), r1=135(y), r2=44(width), r3=75(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 135
LDI r2, 44
LDI r3, 75
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
