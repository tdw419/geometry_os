; DESCRIPTION: Composite: Places a magenta dot at position (300, 229) then Draws a cyan line from (109, 215) to (343, 41) then Creates a cyan circular shape at (314, 82) with radius 10.
; PLAN: r0=300(x), r1=229(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=109(x1), r6=215(y1), r7=343(x2), r8=41(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=314(x), r11=82(y), r12=10(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 300
LDI r1, 229
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 109
LDI r6, 215
LDI r7, 343
LDI r8, 41
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 314
LDI r11, 82
LDI r12, 10
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
