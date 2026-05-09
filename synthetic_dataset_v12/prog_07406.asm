; DESCRIPTION: Draws a green rectangle at (217, 57) with width 42 and height 34.
; PLAN: r0=217(x), r1=57(y), r2=42(width), r3=34(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 57
LDI r2, 42
LDI r3, 34
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
