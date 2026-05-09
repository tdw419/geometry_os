; DESCRIPTION: Renders a orange box of size 70x104 starting at (37, 31).
; PLAN: r0=37(x), r1=31(y), r2=70(width), r3=104(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 31
LDI r2, 70
LDI r3, 104
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
