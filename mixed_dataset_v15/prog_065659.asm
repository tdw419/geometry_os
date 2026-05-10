; DESCRIPTION: Draws a red rectangle at (408, 96) with width 98 and height 60.
; PLAN: r0=408(x), r1=96(y), r2=98(width), r3=60(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 96
LDI r2, 98
LDI r3, 60
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
