; DESCRIPTION: Draws a green rectangle at (444, 202) with width 60 and height 42.
; PLAN: r0=444(x), r1=202(y), r2=60(width), r3=42(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 202
LDI r2, 60
LDI r3, 42
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
