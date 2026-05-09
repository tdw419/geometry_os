; DESCRIPTION: Composite: Places a green dot at position (470, 188) then Renders a cyan box of size 38x107 starting at (163, 70) then Draws a cyan line from (248, 41) to (279, 191).
; PLAN: r0=470(x), r1=188(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=163(x), r6=70(y), r7=38(width), r8=107(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=248(x1), r11=41(y1), r12=279(x2), r13=191(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 470
LDI r1, 188
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 163
LDI r6, 70
LDI r7, 38
LDI r8, 107
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 248
LDI r11, 41
LDI r12, 279
LDI r13, 191
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
