; DESCRIPTION: Composite: Draws a green line from (57, 186) to (467, 193) then Sets a single blue pixel at (497, 228) then Renders a cyan box of size 57x91 starting at (330, 110).
; PLAN: r0=57(x1), r1=186(y1), r2=467(x2), r3=193(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=497(x), r6=228(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=330(x), r11=110(y), r12=57(width), r13=91(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 57
LDI r1, 186
LDI r2, 467
LDI r3, 193
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 497
LDI r6, 228
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 330
LDI r11, 110
LDI r12, 57
LDI r13, 91
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
