; DESCRIPTION: Draws a red rectangle at (218, 200) with width 93 and height 39.
; PLAN: r0=218(x), r1=200(y), r2=93(width), r3=39(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 200
LDI r2, 93
LDI r3, 39
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
