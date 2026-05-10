; DESCRIPTION: Composite: Creates a red circular shape at (313, 84) with radius 67 then Sets a single red pixel at (39, 148) then Renders a black line between points (410, 180) and (388, 172).
; PLAN: r0=313(x), r1=84(y), r2=67(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=39(x), r6=148(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=410(x1), r11=180(y1), r12=388(x2), r13=172(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 313
LDI r1, 84
LDI r2, 67
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 39
LDI r6, 148
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 410
LDI r11, 180
LDI r12, 388
LDI r13, 172
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
