; DESCRIPTION: Renders a orange box of size 102x85 starting at (171, 74).
; PLAN: r0=171(x), r1=74(y), r2=102(width), r3=85(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 74
LDI r2, 102
LDI r3, 85
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
