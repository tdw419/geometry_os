; DESCRIPTION: Draws a white rectangle at (347, 168) with width 64 and height 60.
; PLAN: r0=347(x), r1=168(y), r2=64(width), r3=60(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 168
LDI r2, 64
LDI r3, 60
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
