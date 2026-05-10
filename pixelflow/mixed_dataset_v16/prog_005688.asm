; DESCRIPTION: Composite: Creates a green circular shape at (92, 81) with radius 77 then Sets a single cyan pixel at (473, 229) then Draws a white line from (63, 122) to (508, 227).
; PLAN: r0=92(x), r1=81(y), r2=77(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=473(x), r6=229(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=63(x1), r11=122(y1), r12=508(x2), r13=227(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 92
LDI r1, 81
LDI r2, 77
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 473
LDI r6, 229
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 63
LDI r11, 122
LDI r12, 508
LDI r13, 227
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
