; DESCRIPTION: Composite: Creates a green circular shape at (402, 176) with radius 38 then Draws a cyan line from (240, 0) to (249, 226) then Sets a single purple pixel at (353, 134).
; PLAN: r0=402(x), r1=176(y), r2=38(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=240(x1), r6=0(y1), r7=249(x2), r8=226(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=353(x), r11=134(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 402
LDI r1, 176
LDI r2, 38
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 240
LDI r6, 0
LDI r7, 249
LDI r8, 226
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 353
LDI r11, 134
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
