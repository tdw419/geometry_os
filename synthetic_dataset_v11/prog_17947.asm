; DESCRIPTION: Renders a orange box of size 107x79 starting at (148, 155).
; PLAN: r0=148(x), r1=155(y), r2=107(width), r3=79(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 155
LDI r2, 107
LDI r3, 79
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
