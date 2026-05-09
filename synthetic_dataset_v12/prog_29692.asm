; DESCRIPTION: Draws a white rectangle at (425, 47) with width 12 and height 36.
; PLAN: r0=425(x), r1=47(y), r2=12(width), r3=36(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 47
LDI r2, 12
LDI r3, 36
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
