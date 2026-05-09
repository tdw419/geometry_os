; DESCRIPTION: Draws a green rectangle at (275, 0) with width 65 and height 34.
; PLAN: r0=275(x), r1=0(y), r2=65(width), r3=34(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 0
LDI r2, 65
LDI r3, 34
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
