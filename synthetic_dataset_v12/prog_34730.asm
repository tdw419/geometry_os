; DESCRIPTION: Renders a orange box of size 17x34 starting at (409, 171).
; PLAN: r0=409(x), r1=171(y), r2=17(width), r3=34(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 171
LDI r2, 17
LDI r3, 34
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
