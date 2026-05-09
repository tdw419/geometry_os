; DESCRIPTION: Composite: Draws a blue rectangle at (91, 24) with width 35 and height 19 then Draws a blue line from (289, 90) to (157, 107).
; PLAN: r0=91(x), r1=24(y), r2=35(width), r3=19(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=289(x1), r6=90(y1), r7=157(x2), r8=107(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 91
LDI r1, 24
LDI r2, 35
LDI r3, 19
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 289
LDI r6, 90
LDI r7, 157
LDI r8, 107
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
