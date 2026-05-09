; DESCRIPTION: Composite: Places a black dot at position (264, 227) then Renders a green disk with center (438, 169) and radius 68 then Renders a orange line between points (284, 96) and (46, 204).
; PLAN: r0=264(x), r1=227(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=438(x), r6=169(y), r7=68(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=284(x1), r11=96(y1), r12=46(x2), r13=204(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 264
LDI r1, 227
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 438
LDI r6, 169
LDI r7, 68
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 284
LDI r11, 96
LDI r12, 46
LDI r13, 204
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
