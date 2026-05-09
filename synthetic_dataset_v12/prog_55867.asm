; DESCRIPTION: Draws a red rectangle at (57, 112) with width 90 and height 61.
; PLAN: r0=57(x), r1=112(y), r2=90(width), r3=61(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 112
LDI r2, 90
LDI r3, 61
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
