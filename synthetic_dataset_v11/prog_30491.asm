; DESCRIPTION: Renders a orange box of size 88x111 starting at (103, 110).
; PLAN: r0=103(x), r1=110(y), r2=88(width), r3=111(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 110
LDI r2, 88
LDI r3, 111
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
