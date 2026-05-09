; DESCRIPTION: Renders a orange box of size 118x52 starting at (213, 60).
; PLAN: r0=213(x), r1=60(y), r2=118(width), r3=52(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 60
LDI r2, 118
LDI r3, 52
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
