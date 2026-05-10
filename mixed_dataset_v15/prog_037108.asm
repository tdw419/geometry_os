; DESCRIPTION: Renders a orange box of size 91x115 starting at (292, 135).
; PLAN: r0=292(x), r1=135(y), r2=91(width), r3=115(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 135
LDI r2, 91
LDI r3, 115
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
