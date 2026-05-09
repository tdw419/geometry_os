; DESCRIPTION: Draws a green rectangle at (150, 202) with width 29 and height 46.
; PLAN: r0=150(x), r1=202(y), r2=29(width), r3=46(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 202
LDI r2, 29
LDI r3, 46
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
