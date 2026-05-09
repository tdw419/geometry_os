; DESCRIPTION: Draws a white rectangle at (58, 74) with width 93 and height 61.
; PLAN: r0=58(x), r1=74(y), r2=93(width), r3=61(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 74
LDI r2, 93
LDI r3, 61
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
