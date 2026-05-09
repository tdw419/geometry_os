; DESCRIPTION: Draws a red rectangle at (388, 131) with width 97 and height 27.
; PLAN: r0=388(x), r1=131(y), r2=97(width), r3=27(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 131
LDI r2, 97
LDI r3, 27
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
