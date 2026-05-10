; DESCRIPTION: Renders a orange box of size 110x52 starting at (241, 200).
; PLAN: r0=241(x), r1=200(y), r2=110(width), r3=52(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 200
LDI r2, 110
LDI r3, 52
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
