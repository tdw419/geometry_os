; DESCRIPTION: Renders a orange box of size 51x110 starting at (28, 66).
; PLAN: r0=28(x), r1=66(y), r2=51(width), r3=110(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 66
LDI r2, 51
LDI r3, 110
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
