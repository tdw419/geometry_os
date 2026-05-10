; DESCRIPTION: Renders a orange box of size 95x61 starting at (148, 135).
; PLAN: r0=148(x), r1=135(y), r2=95(width), r3=61(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 135
LDI r2, 95
LDI r3, 61
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
