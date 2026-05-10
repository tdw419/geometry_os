; DESCRIPTION: Draws a yellow rectangle at (264, 131) with width 77 and height 103.
; PLAN: r0=264(x), r1=131(y), r2=77(width), r3=103(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 131
LDI r2, 77
LDI r3, 103
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
