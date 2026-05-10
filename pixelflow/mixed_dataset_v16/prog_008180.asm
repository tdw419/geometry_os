; DESCRIPTION: Composite: Renders a red disk with center (91, 64) and radius 23 then Renders a yellow line between points (59, 226) and (2, 121).
; PLAN: r0=91(x), r1=64(y), r2=23(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=59(x1), r6=226(y1), r7=2(x2), r8=121(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 91
LDI r1, 64
LDI r2, 23
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 59
LDI r6, 226
LDI r7, 2
LDI r8, 121
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
