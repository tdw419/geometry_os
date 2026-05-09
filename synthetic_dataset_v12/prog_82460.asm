; DESCRIPTION: Draws a yellow rectangle at (400, 182) with width 60 and height 21.
; PLAN: r0=400(x), r1=182(y), r2=60(width), r3=21(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 182
LDI r2, 60
LDI r3, 21
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
