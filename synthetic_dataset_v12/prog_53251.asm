; DESCRIPTION: Draws a white rectangle at (319, 168) with width 111 and height 63.
; PLAN: r0=319(x), r1=168(y), r2=111(width), r3=63(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 168
LDI r2, 111
LDI r3, 63
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
