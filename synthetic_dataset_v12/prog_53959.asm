; DESCRIPTION: Composite: Places a white 36x75 rectangle at position (236, 7) then Sets a single red pixel at (400, 98) then Renders a white line between points (163, 236) and (130, 31).
; PLAN: r0=236(x), r1=7(y), r2=36(width), r3=75(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=400(x), r6=98(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=163(x1), r11=236(y1), r12=130(x2), r13=31(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 236
LDI r1, 7
LDI r2, 36
LDI r3, 75
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 400
LDI r6, 98
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 163
LDI r11, 236
LDI r12, 130
LDI r13, 31
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
