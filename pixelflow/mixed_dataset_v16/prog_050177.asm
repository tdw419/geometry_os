; DESCRIPTION: Composite: Sets a single orange pixel at (357, 48) then Draws a magenta line from (319, 106) to (202, 229) then Places a blue 35x76 rectangle at position (146, 83).
; PLAN: r0=357(x), r1=48(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=319(x1), r6=106(y1), r7=202(x2), r8=229(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=146(x), r11=83(y), r12=35(width), r13=76(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 357
LDI r1, 48
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 319
LDI r6, 106
LDI r7, 202
LDI r8, 229
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 146
LDI r11, 83
LDI r12, 35
LDI r13, 76
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
