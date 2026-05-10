; DESCRIPTION: Draws a yellow rectangle at (305, 61) with width 80 and height 107.
; PLAN: r0=305(x), r1=61(y), r2=80(width), r3=107(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 61
LDI r2, 80
LDI r3, 107
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
