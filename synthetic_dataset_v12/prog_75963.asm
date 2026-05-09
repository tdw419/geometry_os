; DESCRIPTION: Renders a orange box of size 107x108 starting at (260, 148).
; PLAN: r0=260(x), r1=148(y), r2=107(width), r3=108(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 148
LDI r2, 107
LDI r3, 108
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
