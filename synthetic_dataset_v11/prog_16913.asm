; DESCRIPTION: Renders a orange box of size 33x102 starting at (51, 14).
; PLAN: r0=51(x), r1=14(y), r2=33(width), r3=102(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 14
LDI r2, 33
LDI r3, 102
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
