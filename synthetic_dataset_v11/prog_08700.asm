; DESCRIPTION: Renders a orange box of size 59x51 starting at (192, 1).
; PLAN: r0=192(x), r1=1(y), r2=59(width), r3=51(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 1
LDI r2, 59
LDI r3, 51
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
