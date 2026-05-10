; DESCRIPTION: Renders a orange box of size 65x37 starting at (246, 61).
; PLAN: r0=246(x), r1=61(y), r2=65(width), r3=37(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 61
LDI r2, 65
LDI r3, 37
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
