; DESCRIPTION: Renders a orange box of size 59x38 starting at (150, 11).
; PLAN: r0=150(x), r1=11(y), r2=59(width), r3=38(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 11
LDI r2, 59
LDI r3, 38
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
