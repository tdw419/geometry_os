; DESCRIPTION: Renders a orange box of size 119x117 starting at (267, 51).
; PLAN: r0=267(x), r1=51(y), r2=119(width), r3=117(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 51
LDI r2, 119
LDI r3, 117
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
