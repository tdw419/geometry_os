; DESCRIPTION: Renders a orange box of size 58x100 starting at (60, 48).
; PLAN: r0=60(x), r1=48(y), r2=58(width), r3=100(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 48
LDI r2, 58
LDI r3, 100
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
