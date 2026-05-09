; DESCRIPTION: Composite: Renders a purple line between points (394, 99) and (59, 235) then Renders a cyan box of size 55x112 starting at (363, 99) then Sets a single yellow pixel at (162, 0).
; PLAN: r0=394(x1), r1=99(y1), r2=59(x2), r3=235(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=363(x), r6=99(y), r7=55(width), r8=112(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=162(x), r11=0(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 394
LDI r1, 99
LDI r2, 59
LDI r3, 235
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 363
LDI r6, 99
LDI r7, 55
LDI r8, 112
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 162
LDI r11, 0
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
