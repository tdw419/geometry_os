; DESCRIPTION: Draws a red rectangle at (230, 186) with width 44 and height 56.
; PLAN: r0=230(x), r1=186(y), r2=44(width), r3=56(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 186
LDI r2, 44
LDI r3, 56
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
