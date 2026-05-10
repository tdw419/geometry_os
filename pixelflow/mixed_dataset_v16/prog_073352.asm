; DESCRIPTION: Renders a orange box of size 16x92 starting at (76, 90).
; PLAN: r0=76(x), r1=90(y), r2=16(width), r3=92(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 90
LDI r2, 16
LDI r3, 92
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
