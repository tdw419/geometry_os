; DESCRIPTION: Renders a orange box of size 72x120 starting at (77, 106).
; PLAN: r0=77(x), r1=106(y), r2=72(width), r3=120(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 106
LDI r2, 72
LDI r3, 120
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
