; DESCRIPTION: Draws a yellow rectangle at (32, 127) with width 45 and height 102.
; PLAN: r0=32(x), r1=127(y), r2=45(width), r3=102(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 127
LDI r2, 45
LDI r3, 102
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
