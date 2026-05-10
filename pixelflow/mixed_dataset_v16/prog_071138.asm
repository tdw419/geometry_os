; DESCRIPTION: Composite: Renders a cyan line between points (152, 187) and (158, 39) then Sets a single white pixel at (198, 197) then Creates a white circular shape at (158, 157) with radius 40.
; PLAN: r0=152(x1), r1=187(y1), r2=158(x2), r3=39(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=198(x), r6=197(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=158(x), r11=157(y), r12=40(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 152
LDI r1, 187
LDI r2, 158
LDI r3, 39
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 198
LDI r6, 197
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 158
LDI r11, 157
LDI r12, 40
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
