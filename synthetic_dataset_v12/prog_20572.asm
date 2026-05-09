; DESCRIPTION: Draws a red rectangle at (400, 132) with width 39 and height 120.
; PLAN: r0=400(x), r1=132(y), r2=39(width), r3=120(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 132
LDI r2, 39
LDI r3, 120
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
