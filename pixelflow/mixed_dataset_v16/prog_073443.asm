; DESCRIPTION: Composite: Draws a magenta line from (366, 90) to (488, 44) then Draws a orange rectangle at (21, 80) with width 51 and height 75.
; PLAN: r0=366(x1), r1=90(y1), r2=488(x2), r3=44(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=21(x), r6=80(y), r7=51(width), r8=75(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 366
LDI r1, 90
LDI r2, 488
LDI r3, 44
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 21
LDI r6, 80
LDI r7, 51
LDI r8, 75
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
