; DESCRIPTION: Composite: Places a yellow dot at position (48, 229) then Draws a red line from (185, 240) to (213, 29) then Creates a magenta rectangular region at (82, 153) spanning 80 by 42 pixels.
; PLAN: r0=48(x), r1=229(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=185(x1), r6=240(y1), r7=213(x2), r8=29(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=82(x), r11=153(y), r12=80(width), r13=42(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 48
LDI r1, 229
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 185
LDI r6, 240
LDI r7, 213
LDI r8, 29
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 82
LDI r11, 153
LDI r12, 80
LDI r13, 42
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
