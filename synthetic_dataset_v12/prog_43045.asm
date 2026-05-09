; DESCRIPTION: Draws a red rectangle at (324, 127) with width 86 and height 18.
; PLAN: r0=324(x), r1=127(y), r2=86(width), r3=18(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 127
LDI r2, 86
LDI r3, 18
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
