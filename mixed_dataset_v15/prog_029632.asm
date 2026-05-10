; DESCRIPTION: Renders a orange box of size 55x51 starting at (98, 123).
; PLAN: r0=98(x), r1=123(y), r2=55(width), r3=51(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 123
LDI r2, 55
LDI r3, 51
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
