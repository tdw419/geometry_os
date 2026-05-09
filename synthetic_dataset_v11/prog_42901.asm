; DESCRIPTION: Renders a orange box of size 54x60 starting at (115, 155).
; PLAN: r0=115(x), r1=155(y), r2=54(width), r3=60(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 155
LDI r2, 54
LDI r3, 60
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
