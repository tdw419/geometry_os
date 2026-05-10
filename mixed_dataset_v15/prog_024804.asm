; DESCRIPTION: Composite: Renders a magenta line between points (388, 198) and (269, 95) then Renders a cyan box of size 95x94 starting at (38, 55) then Sets a single purple pixel at (193, 73).
; PLAN: r0=388(x1), r1=198(y1), r2=269(x2), r3=95(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=38(x), r6=55(y), r7=95(width), r8=94(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=193(x), r11=73(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 388
LDI r1, 198
LDI r2, 269
LDI r3, 95
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 38
LDI r6, 55
LDI r7, 95
LDI r8, 94
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 193
LDI r11, 73
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
