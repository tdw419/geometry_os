; DESCRIPTION: Renders a orange box of size 49x110 starting at (293, 113).
; PLAN: r0=293(x), r1=113(y), r2=49(width), r3=110(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 113
LDI r2, 49
LDI r3, 110
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
