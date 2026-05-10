; DESCRIPTION: Draws a green rectangle at (272, 47) with width 75 and height 42.
; PLAN: r0=272(x), r1=47(y), r2=75(width), r3=42(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 47
LDI r2, 75
LDI r3, 42
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
