; DESCRIPTION: Draws a red rectangle at (103, 96) with width 45 and height 60.
; PLAN: r0=103(x), r1=96(y), r2=45(width), r3=60(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 96
LDI r2, 45
LDI r3, 60
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
