; DESCRIPTION: Composite: Sets a single red pixel at (246, 11) then Renders a black box of size 87x27 starting at (208, 201) then Renders a black line between points (123, 157) and (216, 59).
; PLAN: r0=246(x), r1=11(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=208(x), r6=201(y), r7=87(width), r8=27(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=123(x1), r11=157(y1), r12=216(x2), r13=59(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 246
LDI r1, 11
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 208
LDI r6, 201
LDI r7, 87
LDI r8, 27
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 123
LDI r11, 157
LDI r12, 216
LDI r13, 59
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
