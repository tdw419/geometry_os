; DESCRIPTION: Composite: Places a black dot at position (19, 204) then Renders a black line between points (254, 57) and (435, 237) then Creates a cyan rectangular region at (289, 34) spanning 13 by 110 pixels.
; PLAN: r0=19(x), r1=204(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=254(x1), r6=57(y1), r7=435(x2), r8=237(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=289(x), r11=34(y), r12=13(width), r13=110(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 19
LDI r1, 204
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 254
LDI r6, 57
LDI r7, 435
LDI r8, 237
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 289
LDI r11, 34
LDI r12, 13
LDI r13, 110
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
