; DESCRIPTION: Draws a blue rectangle at (202, 46) with width 57 and height 44.
; PLAN: r0=202(x), r1=46(y), r2=57(width), r3=44(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 46
LDI r2, 57
LDI r3, 44
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
