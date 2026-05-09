; DESCRIPTION: Composite: Sets a single black pixel at (387, 100) then Creates a cyan rectangular region at (142, 21) spanning 16 by 14 pixels then Places a red line segment connecting (328, 89) to (168, 71).
; PLAN: r0=387(x), r1=100(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=142(x), r6=21(y), r7=16(width), r8=14(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=328(x1), r11=89(y1), r12=168(x2), r13=71(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 387
LDI r1, 100
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 142
LDI r6, 21
LDI r7, 16
LDI r8, 14
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 328
LDI r11, 89
LDI r12, 168
LDI r13, 71
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
