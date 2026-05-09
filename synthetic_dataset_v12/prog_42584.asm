; DESCRIPTION: Composite: Sets a single green pixel at (470, 216) then Creates a green rectangular region at (201, 36) spanning 45 by 98 pixels then Draws a black line from (367, 165) to (42, 115).
; PLAN: r0=470(x), r1=216(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=201(x), r6=36(y), r7=45(width), r8=98(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=367(x1), r11=165(y1), r12=42(x2), r13=115(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 470
LDI r1, 216
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 201
LDI r6, 36
LDI r7, 45
LDI r8, 98
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 367
LDI r11, 165
LDI r12, 42
LDI r13, 115
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
