; DESCRIPTION: Renders a orange box of size 40x49 starting at (440, 119).
; PLAN: r0=440(x), r1=119(y), r2=40(width), r3=49(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 119
LDI r2, 40
LDI r3, 49
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
