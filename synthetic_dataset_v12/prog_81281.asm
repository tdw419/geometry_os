; DESCRIPTION: Renders a orange box of size 91x118 starting at (417, 103).
; PLAN: r0=417(x), r1=103(y), r2=91(width), r3=118(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 103
LDI r2, 91
LDI r3, 118
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
