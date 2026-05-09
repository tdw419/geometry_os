; DESCRIPTION: Renders a orange box of size 19x118 starting at (248, 92).
; PLAN: r0=248(x), r1=92(y), r2=19(width), r3=118(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 92
LDI r2, 19
LDI r3, 118
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
