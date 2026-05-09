; DESCRIPTION: Draws a white rectangle at (425, 152) with width 28 and height 36.
; PLAN: r0=425(x), r1=152(y), r2=28(width), r3=36(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 152
LDI r2, 28
LDI r3, 36
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
