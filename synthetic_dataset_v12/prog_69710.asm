; DESCRIPTION: Draws a white rectangle at (311, 146) with width 21 and height 46.
; PLAN: r0=311(x), r1=146(y), r2=21(width), r3=46(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 146
LDI r2, 21
LDI r3, 46
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
