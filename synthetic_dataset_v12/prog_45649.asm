; DESCRIPTION: Composite: Sets a single blue pixel at (261, 144) then Creates a orange rectangular region at (404, 39) spanning 10 by 110 pixels then Renders a cyan line between points (215, 169) and (242, 129).
; PLAN: r0=261(x), r1=144(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=404(x), r6=39(y), r7=10(width), r8=110(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=215(x1), r11=169(y1), r12=242(x2), r13=129(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 261
LDI r1, 144
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 404
LDI r6, 39
LDI r7, 10
LDI r8, 110
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 215
LDI r11, 169
LDI r12, 242
LDI r13, 129
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
