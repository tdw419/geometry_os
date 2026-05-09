; DESCRIPTION: Composite: Places a yellow 57x33 rectangle at position (6, 33) then Draws a yellow line from (153, 57) to (355, 30) then Sets a single black pixel at (305, 208).
; PLAN: r0=6(x), r1=33(y), r2=57(width), r3=33(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=153(x1), r6=57(y1), r7=355(x2), r8=30(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=305(x), r11=208(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 6
LDI r1, 33
LDI r2, 57
LDI r3, 33
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 153
LDI r6, 57
LDI r7, 355
LDI r8, 30
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 305
LDI r11, 208
LDI r12, 0x000000
PSET r10, r11, r12
HALT
