; DESCRIPTION: Renders a orange box of size 33x17 starting at (185, 23).
; PLAN: r0=185(x), r1=23(y), r2=33(width), r3=17(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 23
LDI r2, 33
LDI r3, 17
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
