; DESCRIPTION: Draws a red rectangle at (198, 145) with width 37 and height 79.
; PLAN: r0=198(x), r1=145(y), r2=37(width), r3=79(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 145
LDI r2, 37
LDI r3, 79
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
