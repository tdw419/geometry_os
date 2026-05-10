; DESCRIPTION: Draws a green rectangle at (392, 38) with width 63 and height 15.
; PLAN: r0=392(x), r1=38(y), r2=63(width), r3=15(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 38
LDI r2, 63
LDI r3, 15
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
