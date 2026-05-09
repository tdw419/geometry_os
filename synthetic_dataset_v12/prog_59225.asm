; DESCRIPTION: Draws a red rectangle at (313, 128) with width 61 and height 107.
; PLAN: r0=313(x), r1=128(y), r2=61(width), r3=107(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 128
LDI r2, 61
LDI r3, 107
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
