; DESCRIPTION: Composite: Renders a purple disk with center (290, 80) and radius 76 then Renders a cyan line between points (90, 185) and (455, 237).
; PLAN: r0=290(x), r1=80(y), r2=76(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=90(x1), r6=185(y1), r7=455(x2), r8=237(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 290
LDI r1, 80
LDI r2, 76
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 90
LDI r6, 185
LDI r7, 455
LDI r8, 237
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
