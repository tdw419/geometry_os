; DESCRIPTION: Composite: Draws a white line from (137, 219) to (388, 169) then Draws a cyan rectangle at (193, 124) with width 27 and height 71 then Sets a single green pixel at (286, 100).
; PLAN: r0=137(x1), r1=219(y1), r2=388(x2), r3=169(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=193(x), r6=124(y), r7=27(width), r8=71(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=286(x), r11=100(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 137
LDI r1, 219
LDI r2, 388
LDI r3, 169
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 193
LDI r6, 124
LDI r7, 27
LDI r8, 71
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 286
LDI r11, 100
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
