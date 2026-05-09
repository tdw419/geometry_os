; DESCRIPTION: Renders a orange box of size 70x102 starting at (106, 48).
; PLAN: r0=106(x), r1=48(y), r2=70(width), r3=102(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 48
LDI r2, 70
LDI r3, 102
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
