; DESCRIPTION: Draws a red rectangle at (131, 99) with width 44 and height 72.
; PLAN: r0=131(x), r1=99(y), r2=44(width), r3=72(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 99
LDI r2, 44
LDI r3, 72
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
