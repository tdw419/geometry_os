; DESCRIPTION: Composite: Draws a cyan rectangle at (407, 75) with width 11 and height 28 then Sets a single white pixel at (468, 214) then Places a cyan line segment connecting (194, 81) to (191, 204).
; PLAN: r0=407(x), r1=75(y), r2=11(width), r3=28(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=468(x), r6=214(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=194(x1), r11=81(y1), r12=191(x2), r13=204(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 407
LDI r1, 75
LDI r2, 11
LDI r3, 28
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 468
LDI r6, 214
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 194
LDI r11, 81
LDI r12, 191
LDI r13, 204
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
