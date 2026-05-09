; DESCRIPTION: Composite: Renders a cyan line between points (473, 31) and (229, 37) then Renders a white box of size 114x112 starting at (194, 132) then Sets a single white pixel at (315, 45).
; PLAN: r0=473(x1), r1=31(y1), r2=229(x2), r3=37(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=194(x), r6=132(y), r7=114(width), r8=112(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=315(x), r11=45(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 473
LDI r1, 31
LDI r2, 229
LDI r3, 37
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 194
LDI r6, 132
LDI r7, 114
LDI r8, 112
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 315
LDI r11, 45
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
