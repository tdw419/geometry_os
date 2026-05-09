; DESCRIPTION: Renders a orange box of size 78x108 starting at (111, 107).
; PLAN: r0=111(x), r1=107(y), r2=78(width), r3=108(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 107
LDI r2, 78
LDI r3, 108
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
