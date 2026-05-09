; DESCRIPTION: Draws a green rectangle at (405, 16) with width 63 and height 97.
; PLAN: r0=405(x), r1=16(y), r2=63(width), r3=97(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 16
LDI r2, 63
LDI r3, 97
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
