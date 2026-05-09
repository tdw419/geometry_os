; DESCRIPTION: Composite: Places a purple dot at position (103, 138) then Renders a cyan disk with center (185, 77) and radius 56 then Places a blue line segment connecting (319, 67) to (331, 71).
; PLAN: r0=103(x), r1=138(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=185(x), r6=77(y), r7=56(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=319(x1), r11=67(y1), r12=331(x2), r13=71(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 103
LDI r1, 138
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 185
LDI r6, 77
LDI r7, 56
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 319
LDI r11, 67
LDI r12, 331
LDI r13, 71
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
