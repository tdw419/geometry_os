; DESCRIPTION: Renders a orange box of size 10x15 starting at (66, 14).
; PLAN: r0=66(x), r1=14(y), r2=10(width), r3=15(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 14
LDI r2, 10
LDI r3, 15
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
