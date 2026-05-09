; DESCRIPTION: Renders a orange box of size 91x63 starting at (400, 137).
; PLAN: r0=400(x), r1=137(y), r2=91(width), r3=63(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 137
LDI r2, 91
LDI r3, 63
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
