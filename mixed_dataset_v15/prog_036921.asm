; DESCRIPTION: Composite: Draws a blue rectangle at (398, 218) with width 96 and height 27 then Draws a white line from (230, 81) to (412, 89) then Places a purple dot at position (194, 103).
; PLAN: r0=398(x), r1=218(y), r2=96(width), r3=27(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=230(x1), r6=81(y1), r7=412(x2), r8=89(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=194(x), r11=103(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 398
LDI r1, 218
LDI r2, 96
LDI r3, 27
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 230
LDI r6, 81
LDI r7, 412
LDI r8, 89
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 194
LDI r11, 103
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
