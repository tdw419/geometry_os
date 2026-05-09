; DESCRIPTION: Renders a orange box of size 107x44 starting at (80, 156).
; PLAN: r0=80(x), r1=156(y), r2=107(width), r3=44(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 156
LDI r2, 107
LDI r3, 44
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
