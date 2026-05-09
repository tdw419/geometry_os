; DESCRIPTION: Composite: Renders a cyan disk with center (273, 191) and radius 62 then Renders a cyan line between points (337, 201) and (60, 92).
; PLAN: r0=273(x), r1=191(y), r2=62(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=337(x1), r6=201(y1), r7=60(x2), r8=92(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 273
LDI r1, 191
LDI r2, 62
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 337
LDI r6, 201
LDI r7, 60
LDI r8, 92
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
