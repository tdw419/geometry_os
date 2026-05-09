; DESCRIPTION: Renders a orange box of size 61x99 starting at (413, 78).
; PLAN: r0=413(x), r1=78(y), r2=61(width), r3=99(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 78
LDI r2, 61
LDI r3, 99
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
