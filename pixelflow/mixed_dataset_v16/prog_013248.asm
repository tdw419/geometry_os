; DESCRIPTION: Places a red 74x20 rectangle at position (266, 155).
; PLAN: r0=266(x), r1=155(y), r2=74(width), r3=20(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 155
LDI r2, 74
LDI r3, 20
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
