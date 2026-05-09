; DESCRIPTION: Renders a orange box of size 51x100 starting at (33, 127).
; PLAN: r0=33(x), r1=127(y), r2=51(width), r3=100(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 127
LDI r2, 51
LDI r3, 100
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
