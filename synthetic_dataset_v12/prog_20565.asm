; DESCRIPTION: Composite: Renders a cyan line between points (340, 248) and (414, 223) then Renders a black disk with center (180, 152) and radius 67 then Sets a single purple pixel at (164, 221).
; PLAN: r0=340(x1), r1=248(y1), r2=414(x2), r3=223(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=180(x), r6=152(y), r7=67(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=164(x), r11=221(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 340
LDI r1, 248
LDI r2, 414
LDI r3, 223
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 180
LDI r6, 152
LDI r7, 67
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 164
LDI r11, 221
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
