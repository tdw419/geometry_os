; DESCRIPTION: Renders a orange box of size 96x37 starting at (261, 66).
; PLAN: r0=261(x), r1=66(y), r2=96(width), r3=37(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 66
LDI r2, 96
LDI r3, 37
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
