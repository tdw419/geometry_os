; DESCRIPTION: Renders a orange box of size 28x14 starting at (303, 30).
; PLAN: r0=303(x), r1=30(y), r2=28(width), r3=14(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 30
LDI r2, 28
LDI r3, 14
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
