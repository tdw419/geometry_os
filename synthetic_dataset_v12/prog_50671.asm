; DESCRIPTION: Draws a green rectangle at (170, 120) with width 64 and height 57.
; PLAN: r0=170(x), r1=120(y), r2=64(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 120
LDI r2, 64
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
