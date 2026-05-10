; DESCRIPTION: Draws a purple rectangle at (400, 44) with width 98 and height 82.
; PLAN: r0=400(x), r1=44(y), r2=98(width), r3=82(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 44
LDI r2, 98
LDI r3, 82
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
