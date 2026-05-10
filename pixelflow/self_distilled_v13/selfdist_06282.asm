; DESCRIPTION: Draws a white rectangle at (251, 186) with width 63 and height 47.
; PLAN: r0=251(x), r1=186(y), r2=63(width), r3=47(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 186
LDI r2, 63
LDI r3, 47
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
