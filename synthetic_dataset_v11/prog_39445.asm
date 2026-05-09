; DESCRIPTION: Draws a red rectangle at (4, 150) with width 80 and height 86.
; PLAN: r0=4(x), r1=150(y), r2=80(width), r3=86(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 150
LDI r2, 80
LDI r3, 86
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
