; DESCRIPTION: Draws a black rectangle at (186, 42) with width 63 and height 79.
; PLAN: r0=186(x), r1=42(y), r2=63(width), r3=79(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 42
LDI r2, 63
LDI r3, 79
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
