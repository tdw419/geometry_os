; DESCRIPTION: Renders a orange box of size 17x113 starting at (21, 1).
; PLAN: r0=21(x), r1=1(y), r2=17(width), r3=113(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 1
LDI r2, 17
LDI r3, 113
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
