; DESCRIPTION: Composite: Draws a blue line from (259, 31) to (233, 103) then Places a cyan circle of radius 66 at center (238, 98) then Creates a cyan rectangular region at (316, 93) spanning 49 by 72 pixels.
; PLAN: r0=259(x1), r1=31(y1), r2=233(x2), r3=103(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=238(x), r6=98(y), r7=66(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=316(x), r11=93(y), r12=49(width), r13=72(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 259
LDI r1, 31
LDI r2, 233
LDI r3, 103
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 238
LDI r6, 98
LDI r7, 66
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 316
LDI r11, 93
LDI r12, 49
LDI r13, 72
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
