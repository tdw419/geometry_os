; DESCRIPTION: Composite: Places a cyan 112x95 rectangle at position (193, 146) then Sets a single purple pixel at (357, 100) then Renders a green line between points (483, 243) and (308, 145).
; PLAN: r0=193(x), r1=146(y), r2=112(width), r3=95(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=357(x), r6=100(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=483(x1), r11=243(y1), r12=308(x2), r13=145(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 193
LDI r1, 146
LDI r2, 112
LDI r3, 95
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 357
LDI r6, 100
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 483
LDI r11, 243
LDI r12, 308
LDI r13, 145
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
