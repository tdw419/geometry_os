; DESCRIPTION: Renders a orange box of size 96x18 starting at (145, 95).
; PLAN: r0=145(x), r1=95(y), r2=96(width), r3=18(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 95
LDI r2, 96
LDI r3, 18
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
