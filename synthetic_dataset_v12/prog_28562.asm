; DESCRIPTION: Renders a orange box of size 61x92 starting at (229, 70).
; PLAN: r0=229(x), r1=70(y), r2=61(width), r3=92(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 70
LDI r2, 61
LDI r3, 92
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
