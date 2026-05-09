; DESCRIPTION: Renders a orange box of size 93x117 starting at (137, 83).
; PLAN: r0=137(x), r1=83(y), r2=93(width), r3=117(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 83
LDI r2, 93
LDI r3, 117
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
