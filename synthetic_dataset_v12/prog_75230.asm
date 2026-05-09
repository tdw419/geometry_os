; DESCRIPTION: Renders a orange box of size 75x70 starting at (252, 92).
; PLAN: r0=252(x), r1=92(y), r2=75(width), r3=70(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 92
LDI r2, 75
LDI r3, 70
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
