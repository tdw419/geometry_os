; DESCRIPTION: Draws a white rectangle at (428, 33) with width 70 and height 111.
; PLAN: r0=428(x), r1=33(y), r2=70(width), r3=111(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 33
LDI r2, 70
LDI r3, 111
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
