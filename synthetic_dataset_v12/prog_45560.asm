; DESCRIPTION: Composite: Creates a cyan rectangular region at (379, 68) spanning 60 by 117 pixels then Sets a single black pixel at (479, 124) then Renders a purple line between points (105, 100) and (460, 131).
; PLAN: r0=379(x), r1=68(y), r2=60(width), r3=117(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=479(x), r6=124(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=105(x1), r11=100(y1), r12=460(x2), r13=131(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 379
LDI r1, 68
LDI r2, 60
LDI r3, 117
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 479
LDI r6, 124
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 105
LDI r11, 100
LDI r12, 460
LDI r13, 131
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
