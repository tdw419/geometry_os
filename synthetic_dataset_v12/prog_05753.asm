; DESCRIPTION: Draws a red rectangle at (197, 182) with width 104 and height 20.
; PLAN: r0=197(x), r1=182(y), r2=104(width), r3=20(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 182
LDI r2, 104
LDI r3, 20
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
