; DESCRIPTION: Renders a orange box of size 117x60 starting at (170, 48).
; PLAN: r0=170(x), r1=48(y), r2=117(width), r3=60(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 48
LDI r2, 117
LDI r3, 60
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
