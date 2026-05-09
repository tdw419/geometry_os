; DESCRIPTION: Draws a red rectangle at (192, 79) with width 64 and height 51.
; PLAN: r0=192(x), r1=79(y), r2=64(width), r3=51(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 79
LDI r2, 64
LDI r3, 51
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
