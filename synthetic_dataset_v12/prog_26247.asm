; DESCRIPTION: Composite: Draws a green rectangle at (255, 152) with width 22 and height 51 then Draws a white line from (393, 168) to (432, 74).
; PLAN: r0=255(x), r1=152(y), r2=22(width), r3=51(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=393(x1), r6=168(y1), r7=432(x2), r8=74(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 255
LDI r1, 152
LDI r2, 22
LDI r3, 51
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 393
LDI r6, 168
LDI r7, 432
LDI r8, 74
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
