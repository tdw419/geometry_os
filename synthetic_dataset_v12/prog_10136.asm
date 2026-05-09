; DESCRIPTION: Draws a yellow rectangle at (127, 202) with width 64 and height 39.
; PLAN: r0=127(x), r1=202(y), r2=64(width), r3=39(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 202
LDI r2, 64
LDI r3, 39
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
