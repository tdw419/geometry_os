; DESCRIPTION: Composite: Places a red line segment connecting (61, 191) to (432, 46) then Sets a single green pixel at (489, 247) then Renders a cyan box of size 56x54 starting at (156, 76).
; PLAN: r0=61(x1), r1=191(y1), r2=432(x2), r3=46(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=489(x), r6=247(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=156(x), r11=76(y), r12=56(width), r13=54(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 61
LDI r1, 191
LDI r2, 432
LDI r3, 46
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 489
LDI r6, 247
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 156
LDI r11, 76
LDI r12, 56
LDI r13, 54
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
