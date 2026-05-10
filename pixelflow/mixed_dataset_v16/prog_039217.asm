; DESCRIPTION: Composite: Places a red dot at position (307, 110) then Renders a cyan line between points (301, 152) and (61, 68) then Draws a red circle centered at (137, 70) with radius 58.
; PLAN: r0=307(x), r1=110(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=301(x1), r6=152(y1), r7=61(x2), r8=68(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=137(x), r11=70(y), r12=58(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 307
LDI r1, 110
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 301
LDI r6, 152
LDI r7, 61
LDI r8, 68
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 137
LDI r11, 70
LDI r12, 58
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
