; DESCRIPTION: Composite: Creates a white rectangular region at (251, 83) spanning 82 by 120 pixels then Places a white dot at position (445, 112) then Renders a purple line between points (442, 252) and (349, 148).
; PLAN: r0=251(x), r1=83(y), r2=82(width), r3=120(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=445(x), r6=112(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=442(x1), r11=252(y1), r12=349(x2), r13=148(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 251
LDI r1, 83
LDI r2, 82
LDI r3, 120
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 445
LDI r6, 112
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 442
LDI r11, 252
LDI r12, 349
LDI r13, 148
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
