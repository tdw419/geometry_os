; DESCRIPTION: Draws a white rectangle at (60, 59) with width 47 and height 58.
; PLAN: r0=60(x), r1=59(y), r2=47(width), r3=58(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 59
LDI r2, 47
LDI r3, 58
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
