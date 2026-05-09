; DESCRIPTION: Renders a orange box of size 73x73 starting at (217, 118).
; PLAN: r0=217(x), r1=118(y), r2=73(width), r3=73(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 118
LDI r2, 73
LDI r3, 73
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
