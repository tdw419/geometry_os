; DESCRIPTION: Draws a green rectangle at (467, 98) with width 42 and height 85.
; PLAN: r0=467(x), r1=98(y), r2=42(width), r3=85(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 98
LDI r2, 42
LDI r3, 85
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
