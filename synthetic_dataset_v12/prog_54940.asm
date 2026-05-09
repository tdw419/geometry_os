; DESCRIPTION: Renders a orange box of size 19x61 starting at (171, 161).
; PLAN: r0=171(x), r1=161(y), r2=19(width), r3=61(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 161
LDI r2, 19
LDI r3, 61
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
