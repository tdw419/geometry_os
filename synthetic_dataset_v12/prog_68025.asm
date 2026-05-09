; DESCRIPTION: Composite: Renders a magenta line between points (134, 109) and (218, 112) then Renders a purple box of size 27x95 starting at (466, 133) then Sets a single green pixel at (29, 34).
; PLAN: r0=134(x1), r1=109(y1), r2=218(x2), r3=112(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=466(x), r6=133(y), r7=27(width), r8=95(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=29(x), r11=34(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 134
LDI r1, 109
LDI r2, 218
LDI r3, 112
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 466
LDI r6, 133
LDI r7, 27
LDI r8, 95
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 29
LDI r11, 34
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
