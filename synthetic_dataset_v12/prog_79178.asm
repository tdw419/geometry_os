; DESCRIPTION: Draws a green rectangle at (399, 171) with width 61 and height 57.
; PLAN: r0=399(x), r1=171(y), r2=61(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 171
LDI r2, 61
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
