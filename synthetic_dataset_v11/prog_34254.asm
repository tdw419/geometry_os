; DESCRIPTION: Renders a orange box of size 20x55 starting at (120, 74).
; PLAN: r0=120(x), r1=74(y), r2=20(width), r3=55(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 74
LDI r2, 20
LDI r3, 55
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
