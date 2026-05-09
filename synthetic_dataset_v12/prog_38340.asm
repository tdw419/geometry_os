; DESCRIPTION: Composite: Renders a magenta disk with center (237, 124) and radius 33 then Places a cyan dot at position (372, 165) then Draws a white line from (124, 78) to (260, 97).
; PLAN: r0=237(x), r1=124(y), r2=33(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=372(x), r6=165(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=124(x1), r11=78(y1), r12=260(x2), r13=97(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 237
LDI r1, 124
LDI r2, 33
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 372
LDI r6, 165
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 124
LDI r11, 78
LDI r12, 260
LDI r13, 97
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
