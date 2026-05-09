; DESCRIPTION: Draws a white rectangle at (218, 14) with width 100 and height 93.
; PLAN: r0=218(x), r1=14(y), r2=100(width), r3=93(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 14
LDI r2, 100
LDI r3, 93
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
