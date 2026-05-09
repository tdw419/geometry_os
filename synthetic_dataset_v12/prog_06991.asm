; DESCRIPTION: Draws a green rectangle at (151, 93) with width 99 and height 77.
; PLAN: r0=151(x), r1=93(y), r2=99(width), r3=77(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 93
LDI r2, 99
LDI r3, 77
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
