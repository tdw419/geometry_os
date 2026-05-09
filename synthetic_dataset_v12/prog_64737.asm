; DESCRIPTION: Renders a orange box of size 113x18 starting at (90, 135).
; PLAN: r0=90(x), r1=135(y), r2=113(width), r3=18(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 135
LDI r2, 113
LDI r3, 18
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
