; DESCRIPTION: Draws a red rectangle at (272, 126) with width 61 and height 75.
; PLAN: r0=272(x), r1=126(y), r2=61(width), r3=75(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 126
LDI r2, 61
LDI r3, 75
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
