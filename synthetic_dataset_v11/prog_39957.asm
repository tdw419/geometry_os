; DESCRIPTION: Draws a white rectangle at (59, 61) with width 90 and height 80.
; PLAN: r0=59(x), r1=61(y), r2=90(width), r3=80(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 61
LDI r2, 90
LDI r3, 80
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
