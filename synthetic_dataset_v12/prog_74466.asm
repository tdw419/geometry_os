; DESCRIPTION: Composite: Renders a blue line between points (251, 62) and (227, 162) then Places a green 39x90 rectangle at position (330, 34) then Sets a single blue pixel at (187, 237).
; PLAN: r0=251(x1), r1=62(y1), r2=227(x2), r3=162(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=330(x), r6=34(y), r7=39(width), r8=90(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=187(x), r11=237(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 251
LDI r1, 62
LDI r2, 227
LDI r3, 162
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 330
LDI r6, 34
LDI r7, 39
LDI r8, 90
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 187
LDI r11, 237
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
