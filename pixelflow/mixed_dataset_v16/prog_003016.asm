; DESCRIPTION: Draws a red rectangle at (174, 73) with width 74 and height 103.
; PLAN: r0=174(x), r1=73(y), r2=74(width), r3=103(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 73
LDI r2, 74
LDI r3, 103
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
