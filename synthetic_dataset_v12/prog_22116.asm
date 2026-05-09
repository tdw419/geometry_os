; DESCRIPTION: Draws a green rectangle at (255, 57) with width 61 and height 24.
; PLAN: r0=255(x), r1=57(y), r2=61(width), r3=24(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 57
LDI r2, 61
LDI r3, 24
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
