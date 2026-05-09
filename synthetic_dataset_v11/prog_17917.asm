; DESCRIPTION: Draws a red rectangle at (25, 21) with width 57 and height 33.
; PLAN: r0=25(x), r1=21(y), r2=57(width), r3=33(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 21
LDI r2, 57
LDI r3, 33
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
