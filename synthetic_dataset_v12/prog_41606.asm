; DESCRIPTION: Renders a orange box of size 73x66 starting at (406, 181).
; PLAN: r0=406(x), r1=181(y), r2=73(width), r3=66(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 181
LDI r2, 73
LDI r3, 66
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
