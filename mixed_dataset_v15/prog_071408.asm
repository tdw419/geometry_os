; DESCRIPTION: Draws a red rectangle at (306, 197) with width 104 and height 16.
; PLAN: r0=306(x), r1=197(y), r2=104(width), r3=16(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 197
LDI r2, 104
LDI r3, 16
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
