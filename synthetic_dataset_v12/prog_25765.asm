; DESCRIPTION: Renders a orange box of size 24x88 starting at (295, 5).
; PLAN: r0=295(x), r1=5(y), r2=24(width), r3=88(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 5
LDI r2, 24
LDI r3, 88
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
