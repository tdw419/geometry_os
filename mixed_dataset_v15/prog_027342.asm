; DESCRIPTION: Composite: Sets a single blue pixel at (73, 128) then Draws a green line from (202, 218) to (88, 6) then Places a white 117x33 rectangle at position (282, 47).
; PLAN: r0=73(x), r1=128(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=202(x1), r6=218(y1), r7=88(x2), r8=6(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=282(x), r11=47(y), r12=117(width), r13=33(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 73
LDI r1, 128
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 202
LDI r6, 218
LDI r7, 88
LDI r8, 6
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 282
LDI r11, 47
LDI r12, 117
LDI r13, 33
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
