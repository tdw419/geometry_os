; DESCRIPTION: Draws a white rectangle at (387, 75) with width 42 and height 94.
; PLAN: r0=387(x), r1=75(y), r2=42(width), r3=94(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 75
LDI r2, 42
LDI r3, 94
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
