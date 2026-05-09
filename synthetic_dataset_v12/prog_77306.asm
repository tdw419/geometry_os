; DESCRIPTION: Renders a orange box of size 63x26 starting at (66, 153).
; PLAN: r0=66(x), r1=153(y), r2=63(width), r3=26(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 153
LDI r2, 63
LDI r3, 26
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
