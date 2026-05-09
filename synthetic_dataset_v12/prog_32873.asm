; DESCRIPTION: Draws a red rectangle at (250, 142) with width 64 and height 61.
; PLAN: r0=250(x), r1=142(y), r2=64(width), r3=61(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 142
LDI r2, 64
LDI r3, 61
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
