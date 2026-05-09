; DESCRIPTION: Renders a orange box of size 70x25 starting at (420, 80).
; PLAN: r0=420(x), r1=80(y), r2=70(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 80
LDI r2, 70
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
