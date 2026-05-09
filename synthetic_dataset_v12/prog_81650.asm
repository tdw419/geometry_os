; DESCRIPTION: Composite: Renders a black box of size 60x118 starting at (292, 87) then Draws a red circle centered at (362, 107) with radius 18.
; PLAN: r0=292(x), r1=87(y), r2=60(width), r3=118(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=362(x), r6=107(y), r7=18(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 292
LDI r1, 87
LDI r2, 60
LDI r3, 118
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 362
LDI r6, 107
LDI r7, 18
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
