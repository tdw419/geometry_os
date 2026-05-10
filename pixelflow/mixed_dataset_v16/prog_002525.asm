; DESCRIPTION: Composite: Places a green dot at position (22, 20) then Draws a blue rectangle at (212, 167) with width 40 and height 22 then Draws a green line from (510, 20) to (24, 7).
; PLAN: r0=22(x), r1=20(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=212(x), r6=167(y), r7=40(width), r8=22(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=510(x1), r11=20(y1), r12=24(x2), r13=7(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 22
LDI r1, 20
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 212
LDI r6, 167
LDI r7, 40
LDI r8, 22
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 510
LDI r11, 20
LDI r12, 24
LDI r13, 7
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
