; DESCRIPTION: Draws a red rectangle at (393, 141) with width 96 and height 82.
; PLAN: r0=393(x), r1=141(y), r2=96(width), r3=82(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 141
LDI r2, 96
LDI r3, 82
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
