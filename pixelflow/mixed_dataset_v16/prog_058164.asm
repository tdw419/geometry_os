; DESCRIPTION: Renders a orange box of size 72x107 starting at (315, 35).
; PLAN: r0=315(x), r1=35(y), r2=72(width), r3=107(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 35
LDI r2, 72
LDI r3, 107
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
