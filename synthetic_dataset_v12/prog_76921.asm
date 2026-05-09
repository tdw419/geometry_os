; DESCRIPTION: Renders a orange box of size 53x20 starting at (51, 167).
; PLAN: r0=51(x), r1=167(y), r2=53(width), r3=20(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 167
LDI r2, 53
LDI r3, 20
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
