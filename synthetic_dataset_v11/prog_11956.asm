; DESCRIPTION: Renders a orange box of size 90x44 starting at (163, 155).
; PLAN: r0=163(x), r1=155(y), r2=90(width), r3=44(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 155
LDI r2, 90
LDI r3, 44
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
