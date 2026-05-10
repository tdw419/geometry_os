; DESCRIPTION: Renders a orange box of size 55x118 starting at (200, 117).
; PLAN: r0=200(x), r1=117(y), r2=55(width), r3=118(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 117
LDI r2, 55
LDI r3, 118
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
