; DESCRIPTION: Renders a orange box of size 37x33 starting at (178, 118).
; PLAN: r0=178(x), r1=118(y), r2=37(width), r3=33(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 118
LDI r2, 37
LDI r3, 33
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
