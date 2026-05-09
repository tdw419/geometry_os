; DESCRIPTION: Composite: Draws a blue rectangle at (323, 30) with width 34 and height 78 then Places a white dot at position (466, 124) then Draws a red line from (135, 127) to (6, 213).
; PLAN: r0=323(x), r1=30(y), r2=34(width), r3=78(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=466(x), r6=124(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=135(x1), r11=127(y1), r12=6(x2), r13=213(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 323
LDI r1, 30
LDI r2, 34
LDI r3, 78
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 466
LDI r6, 124
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 135
LDI r11, 127
LDI r12, 6
LDI r13, 213
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
