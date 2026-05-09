; DESCRIPTION: Composite: Renders a purple disk with center (48, 211) and radius 38 then Renders a cyan line between points (156, 234) and (182, 226).
; PLAN: r0=48(x), r1=211(y), r2=38(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=156(x1), r6=234(y1), r7=182(x2), r8=226(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 48
LDI r1, 211
LDI r2, 38
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 156
LDI r6, 234
LDI r7, 182
LDI r8, 226
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
