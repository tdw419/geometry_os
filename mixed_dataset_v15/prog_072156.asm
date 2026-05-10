; DESCRIPTION: Composite: Sets a single magenta pixel at (389, 166) then Places a purple 96x24 rectangle at position (77, 217) then Places a green line segment connecting (84, 77) to (405, 59).
; PLAN: r0=389(x), r1=166(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=77(x), r6=217(y), r7=96(width), r8=24(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=84(x1), r11=77(y1), r12=405(x2), r13=59(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 389
LDI r1, 166
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 77
LDI r6, 217
LDI r7, 96
LDI r8, 24
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 84
LDI r11, 77
LDI r12, 405
LDI r13, 59
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
