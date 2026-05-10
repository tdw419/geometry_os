; DESCRIPTION: Renders a orange box of size 25x11 starting at (352, 48).
; PLAN: r0=352(x), r1=48(y), r2=25(width), r3=11(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 48
LDI r2, 25
LDI r3, 11
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
