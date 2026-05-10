; DESCRIPTION: Renders a orange box of size 58x13 starting at (253, 226).
; PLAN: r0=253(x), r1=226(y), r2=58(width), r3=13(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 226
LDI r2, 58
LDI r3, 13
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
