; DESCRIPTION: Renders a orange box of size 72x115 starting at (9, 40).
; PLAN: r0=9(x), r1=40(y), r2=72(width), r3=115(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 40
LDI r2, 72
LDI r3, 115
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
