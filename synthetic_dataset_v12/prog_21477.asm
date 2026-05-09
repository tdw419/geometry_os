; DESCRIPTION: Renders a orange box of size 14x75 starting at (380, 92).
; PLAN: r0=380(x), r1=92(y), r2=14(width), r3=75(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 92
LDI r2, 14
LDI r3, 75
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
