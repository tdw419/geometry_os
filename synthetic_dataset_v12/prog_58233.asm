; DESCRIPTION: Renders a orange box of size 50x105 starting at (40, 52).
; PLAN: r0=40(x), r1=52(y), r2=50(width), r3=105(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 52
LDI r2, 50
LDI r3, 105
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
