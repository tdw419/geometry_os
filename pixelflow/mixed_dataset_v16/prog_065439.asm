; DESCRIPTION: Draws a green rectangle at (262, 117) with width 74 and height 59.
; PLAN: r0=262(x), r1=117(y), r2=74(width), r3=59(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 117
LDI r2, 74
LDI r3, 59
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
