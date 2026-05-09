; DESCRIPTION: Renders a orange box of size 48x110 starting at (69, 61).
; PLAN: r0=69(x), r1=61(y), r2=48(width), r3=110(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 61
LDI r2, 48
LDI r3, 110
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
