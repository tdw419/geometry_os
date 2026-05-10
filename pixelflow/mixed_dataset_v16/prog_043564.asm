; DESCRIPTION: Composite: Renders a green line between points (306, 168) and (430, 178) then Renders a cyan disk with center (323, 137) and radius 65 then Sets a single blue pixel at (413, 27).
; PLAN: r0=306(x1), r1=168(y1), r2=430(x2), r3=178(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=323(x), r6=137(y), r7=65(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=413(x), r11=27(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 306
LDI r1, 168
LDI r2, 430
LDI r3, 178
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 323
LDI r6, 137
LDI r7, 65
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 413
LDI r11, 27
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
