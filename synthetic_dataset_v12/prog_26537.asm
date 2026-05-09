; DESCRIPTION: Draws a red rectangle at (422, 99) with width 60 and height 65.
; PLAN: r0=422(x), r1=99(y), r2=60(width), r3=65(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 99
LDI r2, 60
LDI r3, 65
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
