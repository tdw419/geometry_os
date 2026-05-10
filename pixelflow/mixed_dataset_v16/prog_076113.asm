; DESCRIPTION: Renders a orange box of size 113x95 starting at (347, 136).
; PLAN: r0=347(x), r1=136(y), r2=113(width), r3=95(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 136
LDI r2, 113
LDI r3, 95
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
