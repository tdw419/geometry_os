; DESCRIPTION: Renders a orange box of size 72x52 starting at (65, 30).
; PLAN: r0=65(x), r1=30(y), r2=72(width), r3=52(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 30
LDI r2, 72
LDI r3, 52
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
