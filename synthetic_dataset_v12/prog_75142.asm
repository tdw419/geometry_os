; DESCRIPTION: Composite: Draws a cyan line from (102, 208) to (346, 126) then Sets a single cyan pixel at (141, 136) then Draws a yellow circle centered at (252, 39) with radius 21.
; PLAN: r0=102(x1), r1=208(y1), r2=346(x2), r3=126(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=141(x), r6=136(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=252(x), r11=39(y), r12=21(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 102
LDI r1, 208
LDI r2, 346
LDI r3, 126
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 141
LDI r6, 136
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 252
LDI r11, 39
LDI r12, 21
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
