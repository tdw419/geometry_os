; DESCRIPTION: Draws a red rectangle at (350, 56) with width 107 and height 20.
; PLAN: r0=350(x), r1=56(y), r2=107(width), r3=20(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 56
LDI r2, 107
LDI r3, 20
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
