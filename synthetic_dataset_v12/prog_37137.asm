; DESCRIPTION: Composite: Places a orange dot at position (218, 131) then Creates a magenta rectangular region at (297, 152) spanning 44 by 35 pixels then Renders a cyan line between points (453, 140) and (422, 130).
; PLAN: r0=218(x), r1=131(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=297(x), r6=152(y), r7=44(width), r8=35(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=453(x1), r11=140(y1), r12=422(x2), r13=130(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 218
LDI r1, 131
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 297
LDI r6, 152
LDI r7, 44
LDI r8, 35
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 453
LDI r11, 140
LDI r12, 422
LDI r13, 130
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
