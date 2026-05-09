; DESCRIPTION: Composite: Renders a cyan disk with center (456, 57) and radius 40 then Renders a black line between points (222, 120) and (418, 62).
; PLAN: r0=456(x), r1=57(y), r2=40(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=222(x1), r6=120(y1), r7=418(x2), r8=62(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 456
LDI r1, 57
LDI r2, 40
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 222
LDI r6, 120
LDI r7, 418
LDI r8, 62
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
