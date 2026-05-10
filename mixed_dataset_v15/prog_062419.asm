; DESCRIPTION: Draws a green rectangle at (89, 82) with width 42 and height 94.
; PLAN: r0=89(x), r1=82(y), r2=42(width), r3=94(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 82
LDI r2, 42
LDI r3, 94
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
