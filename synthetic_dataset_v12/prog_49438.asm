; DESCRIPTION: Composite: Creates a cyan circular shape at (158, 55) with radius 31 then Sets a single purple pixel at (420, 213) then Draws a black line from (50, 36) to (414, 236).
; PLAN: r0=158(x), r1=55(y), r2=31(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=420(x), r6=213(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=50(x1), r11=36(y1), r12=414(x2), r13=236(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 158
LDI r1, 55
LDI r2, 31
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 420
LDI r6, 213
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 50
LDI r11, 36
LDI r12, 414
LDI r13, 236
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
