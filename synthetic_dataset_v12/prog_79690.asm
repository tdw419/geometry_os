; DESCRIPTION: Draws a white rectangle at (406, 131) with width 46 and height 47.
; PLAN: r0=406(x), r1=131(y), r2=46(width), r3=47(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 131
LDI r2, 46
LDI r3, 47
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
