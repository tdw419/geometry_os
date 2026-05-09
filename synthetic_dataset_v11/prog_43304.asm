; DESCRIPTION: Draws a orange rectangle at (142, 5) with width 57 and height 111.
; PLAN: r0=142(x), r1=5(y), r2=57(width), r3=111(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 5
LDI r2, 57
LDI r3, 111
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
