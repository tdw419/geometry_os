; DESCRIPTION: Draws a blue rectangle at (46, 33) with width 70 and height 99.
; PLAN: r0=46(x), r1=33(y), r2=70(width), r3=99(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 33
LDI r2, 70
LDI r3, 99
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
