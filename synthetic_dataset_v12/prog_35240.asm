; DESCRIPTION: Composite: Places a green 118x102 rectangle at position (150, 104) then Sets a single red pixel at (168, 97) then Renders a cyan line between points (352, 200) and (492, 244).
; PLAN: r0=150(x), r1=104(y), r2=118(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=168(x), r6=97(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=352(x1), r11=200(y1), r12=492(x2), r13=244(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 150
LDI r1, 104
LDI r2, 118
LDI r3, 102
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 168
LDI r6, 97
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 352
LDI r11, 200
LDI r12, 492
LDI r13, 244
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
