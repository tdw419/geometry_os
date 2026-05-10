; DESCRIPTION: Draws a red rectangle at (199, 90) with width 16 and height 35.
; PLAN: r0=199(x), r1=90(y), r2=16(width), r3=35(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 90
LDI r2, 16
LDI r3, 35
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
