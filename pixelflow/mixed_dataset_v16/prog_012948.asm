; DESCRIPTION: Composite: Sets a single red pixel at (92, 92) then Draws a cyan line from (68, 14) to (189, 4) then Creates a red rectangular region at (371, 93) spanning 92 by 16 pixels.
; PLAN: r0=92(x), r1=92(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=68(x1), r6=14(y1), r7=189(x2), r8=4(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=371(x), r11=93(y), r12=92(width), r13=16(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 92
LDI r1, 92
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 68
LDI r6, 14
LDI r7, 189
LDI r8, 4
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 371
LDI r11, 93
LDI r12, 92
LDI r13, 16
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
