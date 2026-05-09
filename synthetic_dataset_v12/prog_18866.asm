; DESCRIPTION: Composite: Renders a purple disk with center (250, 180) and radius 67 then Places a orange dot at position (247, 36) then Places a white line segment connecting (333, 77) to (480, 61).
; PLAN: r0=250(x), r1=180(y), r2=67(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=247(x), r6=36(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=333(x1), r11=77(y1), r12=480(x2), r13=61(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 250
LDI r1, 180
LDI r2, 67
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 247
LDI r6, 36
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 333
LDI r11, 77
LDI r12, 480
LDI r13, 61
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
