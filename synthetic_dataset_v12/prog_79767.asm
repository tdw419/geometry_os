; DESCRIPTION: Composite: Places a magenta line segment connecting (314, 0) to (171, 37) then Places a black dot at position (466, 161) then Places a white 58x54 rectangle at position (73, 7).
; PLAN: r0=314(x1), r1=0(y1), r2=171(x2), r3=37(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=466(x), r6=161(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=73(x), r11=7(y), r12=58(width), r13=54(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 314
LDI r1, 0
LDI r2, 171
LDI r3, 37
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 466
LDI r6, 161
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 73
LDI r11, 7
LDI r12, 58
LDI r13, 54
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
