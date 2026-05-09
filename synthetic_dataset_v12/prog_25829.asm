; DESCRIPTION: Composite: Sets a single red pixel at (202, 109) then Draws a blue circle centered at (224, 85) with radius 50 then Renders a white line between points (246, 189) and (323, 166).
; PLAN: r0=202(x), r1=109(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=224(x), r6=85(y), r7=50(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=246(x1), r11=189(y1), r12=323(x2), r13=166(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 202
LDI r1, 109
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 224
LDI r6, 85
LDI r7, 50
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 246
LDI r11, 189
LDI r12, 323
LDI r13, 166
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
