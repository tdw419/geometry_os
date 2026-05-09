; DESCRIPTION: Draws a magenta rectangle at (198, 58) with width 57 and height 109.
; PLAN: r0=198(x), r1=58(y), r2=57(width), r3=109(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 58
LDI r2, 57
LDI r3, 109
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
