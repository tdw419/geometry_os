; DESCRIPTION: Composite: Places a white 14x59 rectangle at position (493, 102) then Renders a purple disk with center (400, 98) and radius 75 then Renders a purple line between points (430, 15) and (386, 247).
; PLAN: r0=493(x), r1=102(y), r2=14(width), r3=59(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=400(x), r6=98(y), r7=75(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=430(x1), r11=15(y1), r12=386(x2), r13=247(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 493
LDI r1, 102
LDI r2, 14
LDI r3, 59
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 400
LDI r6, 98
LDI r7, 75
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 430
LDI r11, 15
LDI r12, 386
LDI r13, 247
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
