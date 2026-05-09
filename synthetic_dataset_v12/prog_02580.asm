; DESCRIPTION: Draws a white rectangle at (362, 92) with width 28 and height 27.
; PLAN: r0=362(x), r1=92(y), r2=28(width), r3=27(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 92
LDI r2, 28
LDI r3, 27
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
