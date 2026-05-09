; DESCRIPTION: Composite: Sets a single orange pixel at (447, 145) then Renders a cyan box of size 82x57 starting at (212, 27) then Renders a magenta line between points (470, 156) and (90, 234).
; PLAN: r0=447(x), r1=145(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=212(x), r6=27(y), r7=82(width), r8=57(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=470(x1), r11=156(y1), r12=90(x2), r13=234(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 447
LDI r1, 145
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 212
LDI r6, 27
LDI r7, 82
LDI r8, 57
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 470
LDI r11, 156
LDI r12, 90
LDI r13, 234
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
