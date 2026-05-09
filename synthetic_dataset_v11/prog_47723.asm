; DESCRIPTION: Renders a orange box of size 77x47 starting at (20, 90).
; PLAN: r0=20(x), r1=90(y), r2=77(width), r3=47(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 90
LDI r2, 77
LDI r3, 47
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
