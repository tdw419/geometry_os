; DESCRIPTION: Draws a red rectangle at (26, 127) with width 77 and height 57.
; PLAN: r0=26(x), r1=127(y), r2=77(width), r3=57(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 127
LDI r2, 77
LDI r3, 57
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
