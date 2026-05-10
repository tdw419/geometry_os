; DESCRIPTION: Composite: Creates a purple circular shape at (234, 182) with radius 59 then Draws a cyan line from (261, 51) to (82, 146) then Creates a white rectangular region at (9, 6) spanning 82 by 74 pixels.
; PLAN: r0=234(x), r1=182(y), r2=59(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=261(x1), r6=51(y1), r7=82(x2), r8=146(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=9(x), r11=6(y), r12=82(width), r13=74(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 234
LDI r1, 182
LDI r2, 59
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 261
LDI r6, 51
LDI r7, 82
LDI r8, 146
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 9
LDI r11, 6
LDI r12, 82
LDI r13, 74
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
