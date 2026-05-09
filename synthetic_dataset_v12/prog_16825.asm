; DESCRIPTION: Composite: Sets a single blue pixel at (231, 184) then Draws a magenta line from (368, 20) to (352, 173) then Draws a blue circle centered at (462, 129) with radius 34.
; PLAN: r0=231(x), r1=184(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=368(x1), r6=20(y1), r7=352(x2), r8=173(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=462(x), r11=129(y), r12=34(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 231
LDI r1, 184
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 368
LDI r6, 20
LDI r7, 352
LDI r8, 173
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 462
LDI r11, 129
LDI r12, 34
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
