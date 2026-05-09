; DESCRIPTION: Draws a green rectangle at (57, 63) with width 61 and height 54.
; PLAN: r0=57(x), r1=63(y), r2=61(width), r3=54(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 63
LDI r2, 61
LDI r3, 54
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
