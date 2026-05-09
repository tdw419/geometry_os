; DESCRIPTION: Renders a orange box of size 80x34 starting at (2, 48).
; PLAN: r0=2(x), r1=48(y), r2=80(width), r3=34(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 48
LDI r2, 80
LDI r3, 34
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
