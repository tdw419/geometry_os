; DESCRIPTION: Draws a black rectangle at (57, 20) with width 85 and height 50.
; PLAN: r0=57(x), r1=20(y), r2=85(width), r3=50(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 20
LDI r2, 85
LDI r3, 50
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
