; DESCRIPTION: Composite: Renders a cyan line between points (473, 199) and (61, 40) then Creates a red rectangular region at (104, 181) spanning 80 by 64 pixels then Sets a single cyan pixel at (428, 111).
; PLAN: r0=473(x1), r1=199(y1), r2=61(x2), r3=40(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=104(x), r6=181(y), r7=80(width), r8=64(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=428(x), r11=111(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 473
LDI r1, 199
LDI r2, 61
LDI r3, 40
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 104
LDI r6, 181
LDI r7, 80
LDI r8, 64
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 428
LDI r11, 111
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
