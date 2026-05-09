; DESCRIPTION: Renders a orange box of size 31x70 starting at (33, 80).
; PLAN: r0=33(x), r1=80(y), r2=31(width), r3=70(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 80
LDI r2, 31
LDI r3, 70
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
