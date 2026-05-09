; DESCRIPTION: Draws a white rectangle at (313, 186) with width 112 and height 28.
; PLAN: r0=313(x), r1=186(y), r2=112(width), r3=28(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 186
LDI r2, 112
LDI r3, 28
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
