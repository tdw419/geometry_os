; DESCRIPTION: Composite: Draws a white line from (334, 30) to (289, 164) then Draws a blue rectangle at (363, 81) with width 11 and height 28.
; PLAN: r0=334(x1), r1=30(y1), r2=289(x2), r3=164(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=363(x), r6=81(y), r7=11(width), r8=28(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 334
LDI r1, 30
LDI r2, 289
LDI r3, 164
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 363
LDI r6, 81
LDI r7, 11
LDI r8, 28
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
