; DESCRIPTION: Composite: Renders a cyan disk with center (263, 154) and radius 78 then Renders a red line between points (226, 90) and (22, 181) then Sets a single purple pixel at (176, 246).
; PLAN: r0=263(x), r1=154(y), r2=78(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=226(x1), r6=90(y1), r7=22(x2), r8=181(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=176(x), r11=246(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 263
LDI r1, 154
LDI r2, 78
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 226
LDI r6, 90
LDI r7, 22
LDI r8, 181
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 176
LDI r11, 246
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
