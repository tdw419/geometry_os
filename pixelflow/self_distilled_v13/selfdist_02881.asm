; DESCRIPTION: Draws a yellow rectangle at (331, 93) with width 85 and height 58.
; PLAN: r0=331(x), r1=93(y), r2=85(width), r3=58(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 93
LDI r2, 85
LDI r3, 58
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
