; DESCRIPTION: Composite: Draws a cyan line from (169, 9) to (28, 127) then Places a green circle of radius 28 at center (315, 157) then Places a white dot at position (387, 186).
; PLAN: r0=169(x1), r1=9(y1), r2=28(x2), r3=127(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=315(x), r6=157(y), r7=28(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=387(x), r11=186(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 169
LDI r1, 9
LDI r2, 28
LDI r3, 127
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 315
LDI r6, 157
LDI r7, 28
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 387
LDI r11, 186
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
