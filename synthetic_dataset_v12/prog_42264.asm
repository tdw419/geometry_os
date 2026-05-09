; DESCRIPTION: Renders a orange box of size 102x63 starting at (282, 40).
; PLAN: r0=282(x), r1=40(y), r2=102(width), r3=63(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 40
LDI r2, 102
LDI r3, 63
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
