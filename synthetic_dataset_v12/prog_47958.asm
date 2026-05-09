; DESCRIPTION: Draws a red rectangle at (210, 170) with width 27 and height 53.
; PLAN: r0=210(x), r1=170(y), r2=27(width), r3=53(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 170
LDI r2, 27
LDI r3, 53
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
