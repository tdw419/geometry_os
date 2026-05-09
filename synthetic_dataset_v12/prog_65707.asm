; DESCRIPTION: Renders a orange box of size 91x60 starting at (114, 50).
; PLAN: r0=114(x), r1=50(y), r2=91(width), r3=60(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 50
LDI r2, 91
LDI r3, 60
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
