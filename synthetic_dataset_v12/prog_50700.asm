; DESCRIPTION: Draws a white rectangle at (108, 200) with width 42 and height 47.
; PLAN: r0=108(x), r1=200(y), r2=42(width), r3=47(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 200
LDI r2, 42
LDI r3, 47
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
