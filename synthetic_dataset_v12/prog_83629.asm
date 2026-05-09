; DESCRIPTION: Renders a orange box of size 54x83 starting at (68, 95).
; PLAN: r0=68(x), r1=95(y), r2=54(width), r3=83(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 95
LDI r2, 54
LDI r3, 83
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
