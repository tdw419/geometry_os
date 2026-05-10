; DESCRIPTION: Composite: Draws a white circle centered at (184, 156) with radius 74 then Sets a single green pixel at (368, 129) then Draws a magenta line from (307, 44) to (249, 129).
; PLAN: r0=184(x), r1=156(y), r2=74(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=368(x), r6=129(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=307(x1), r11=44(y1), r12=249(x2), r13=129(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 184
LDI r1, 156
LDI r2, 74
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 368
LDI r6, 129
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 307
LDI r11, 44
LDI r12, 249
LDI r13, 129
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
