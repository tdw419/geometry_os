; DESCRIPTION: Composite: Sets a single black pixel at (168, 158) then Places a white 23x25 rectangle at position (177, 229) then Places a magenta line segment connecting (89, 69) to (385, 143).
; PLAN: r0=168(x), r1=158(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=177(x), r6=229(y), r7=23(width), r8=25(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=89(x1), r11=69(y1), r12=385(x2), r13=143(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 168
LDI r1, 158
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 177
LDI r6, 229
LDI r7, 23
LDI r8, 25
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 89
LDI r11, 69
LDI r12, 385
LDI r13, 143
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
