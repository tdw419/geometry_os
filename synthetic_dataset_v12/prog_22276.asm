; DESCRIPTION: Composite: Sets a single white pixel at (136, 92) then Renders a cyan disk with center (321, 160) and radius 70 then Draws a white line from (395, 122) to (82, 150).
; PLAN: r0=136(x), r1=92(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=321(x), r6=160(y), r7=70(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=395(x1), r11=122(y1), r12=82(x2), r13=150(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 136
LDI r1, 92
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 321
LDI r6, 160
LDI r7, 70
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 395
LDI r11, 122
LDI r12, 82
LDI r13, 150
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
