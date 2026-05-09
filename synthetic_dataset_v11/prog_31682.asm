; DESCRIPTION: Renders a orange box of size 48x105 starting at (22, 24).
; PLAN: r0=22(x), r1=24(y), r2=48(width), r3=105(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 24
LDI r2, 48
LDI r3, 105
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
