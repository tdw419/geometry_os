; DESCRIPTION: Draws a orange rectangle at (425, 49) with width 61 and height 112.
; PLAN: r0=425(x), r1=49(y), r2=61(width), r3=112(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 49
LDI r2, 61
LDI r3, 112
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
