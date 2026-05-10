; DESCRIPTION: Draws a green rectangle at (127, 107) with width 60 and height 32.
; PLAN: r0=127(x), r1=107(y), r2=60(width), r3=32(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 107
LDI r2, 60
LDI r3, 32
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
