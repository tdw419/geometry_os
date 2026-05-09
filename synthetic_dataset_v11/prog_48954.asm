; DESCRIPTION: Renders a orange box of size 43x25 starting at (160, 112).
; PLAN: r0=160(x), r1=112(y), r2=43(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 112
LDI r2, 43
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
