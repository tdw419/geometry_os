; DESCRIPTION: Composite: Renders a red disk with center (407, 138) and radius 54 then Renders a cyan box of size 35x59 starting at (466, 57) then Draws a green line from (104, 30) to (17, 26).
; PLAN: r0=407(x), r1=138(y), r2=54(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=466(x), r6=57(y), r7=35(width), r8=59(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=104(x1), r11=30(y1), r12=17(x2), r13=26(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 407
LDI r1, 138
LDI r2, 54
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 466
LDI r6, 57
LDI r7, 35
LDI r8, 59
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 104
LDI r11, 30
LDI r12, 17
LDI r13, 26
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
