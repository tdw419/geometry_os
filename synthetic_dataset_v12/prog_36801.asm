; DESCRIPTION: Composite: Sets a single red pixel at (147, 218) then Renders a magenta box of size 91x69 starting at (50, 124) then Draws a magenta line from (110, 221) to (425, 140).
; PLAN: r0=147(x), r1=218(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=50(x), r6=124(y), r7=91(width), r8=69(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=110(x1), r11=221(y1), r12=425(x2), r13=140(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 147
LDI r1, 218
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 50
LDI r6, 124
LDI r7, 91
LDI r8, 69
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 110
LDI r11, 221
LDI r12, 425
LDI r13, 140
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
