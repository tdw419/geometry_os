; DESCRIPTION: Composite: Draws a black rectangle at (18, 7) with width 111 and height 65 then Places a cyan line segment connecting (112, 110) to (362, 141).
; PLAN: r0=18(x), r1=7(y), r2=111(width), r3=65(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=112(x1), r6=110(y1), r7=362(x2), r8=141(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 18
LDI r1, 7
LDI r2, 111
LDI r3, 65
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 112
LDI r6, 110
LDI r7, 362
LDI r8, 141
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
