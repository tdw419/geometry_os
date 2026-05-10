; DESCRIPTION: Renders a orange box of size 71x97 starting at (39, 25).
; PLAN: r0=39(x), r1=25(y), r2=71(width), r3=97(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 25
LDI r2, 71
LDI r3, 97
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
