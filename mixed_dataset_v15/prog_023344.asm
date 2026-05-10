; DESCRIPTION: Renders a orange box of size 41x110 starting at (260, 60).
; PLAN: r0=260(x), r1=60(y), r2=41(width), r3=110(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 60
LDI r2, 41
LDI r3, 110
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
