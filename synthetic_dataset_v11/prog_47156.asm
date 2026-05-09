; DESCRIPTION: Draws a red rectangle at (65, 119) with width 111 and height 57.
; PLAN: r0=65(x), r1=119(y), r2=111(width), r3=57(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 119
LDI r2, 111
LDI r3, 57
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
