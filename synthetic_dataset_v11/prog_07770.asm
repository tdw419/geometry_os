; DESCRIPTION: Renders a orange box of size 87x58 starting at (75, 92).
; PLAN: r0=75(x), r1=92(y), r2=87(width), r3=58(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 92
LDI r2, 87
LDI r3, 58
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
