; DESCRIPTION: Draws a purple rectangle at (386, 174) with width 44 and height 50.
; PLAN: r0=386(x), r1=174(y), r2=44(width), r3=50(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 174
LDI r2, 44
LDI r3, 50
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
