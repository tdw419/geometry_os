; DESCRIPTION: Composite: Draws a purple line from (251, 22) to (166, 229) then Sets a single cyan pixel at (189, 219) then Draws a cyan rectangle at (401, 151) with width 46 and height 98.
; PLAN: r0=251(x1), r1=22(y1), r2=166(x2), r3=229(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=189(x), r6=219(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=401(x), r11=151(y), r12=46(width), r13=98(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 251
LDI r1, 22
LDI r2, 166
LDI r3, 229
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 189
LDI r6, 219
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 401
LDI r11, 151
LDI r12, 46
LDI r13, 98
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
