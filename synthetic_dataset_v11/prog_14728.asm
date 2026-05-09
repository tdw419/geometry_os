; DESCRIPTION: Draws a blue rectangle at (146, 58) with width 61 and height 73.
; PLAN: r0=146(x), r1=58(y), r2=61(width), r3=73(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 58
LDI r2, 61
LDI r3, 73
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
