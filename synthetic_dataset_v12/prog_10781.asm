; DESCRIPTION: Composite: Creates a purple circular shape at (365, 123) with radius 71 then Renders a red line between points (32, 13) and (39, 58).
; PLAN: r0=365(x), r1=123(y), r2=71(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=32(x1), r6=13(y1), r7=39(x2), r8=58(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 365
LDI r1, 123
LDI r2, 71
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 32
LDI r6, 13
LDI r7, 39
LDI r8, 58
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
