; DESCRIPTION: Renders a orange box of size 59x30 starting at (425, 135).
; PLAN: r0=425(x), r1=135(y), r2=59(width), r3=30(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 135
LDI r2, 59
LDI r3, 30
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
