; DESCRIPTION: Renders a orange box of size 97x52 starting at (70, 171).
; PLAN: r0=70(x), r1=171(y), r2=97(width), r3=52(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 171
LDI r2, 97
LDI r3, 52
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
