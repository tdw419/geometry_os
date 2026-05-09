; DESCRIPTION: Renders a orange box of size 51x11 starting at (73, 54).
; PLAN: r0=73(x), r1=54(y), r2=51(width), r3=11(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 54
LDI r2, 51
LDI r3, 11
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
