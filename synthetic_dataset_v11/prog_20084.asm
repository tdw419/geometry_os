; DESCRIPTION: Draws a red rectangle at (39, 186) with width 74 and height 19.
; PLAN: r0=39(x), r1=186(y), r2=74(width), r3=19(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 186
LDI r2, 74
LDI r3, 19
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
