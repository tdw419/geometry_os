; DESCRIPTION: Renders a orange box of size 38x96 starting at (345, 159).
; PLAN: r0=345(x), r1=159(y), r2=38(width), r3=96(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 159
LDI r2, 38
LDI r3, 96
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
