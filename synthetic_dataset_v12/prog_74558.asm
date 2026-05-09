; DESCRIPTION: Composite: Places a black circle of radius 24 at center (151, 65) then Renders a red line between points (27, 181) and (46, 119).
; PLAN: r0=151(x), r1=65(y), r2=24(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=27(x1), r6=181(y1), r7=46(x2), r8=119(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 151
LDI r1, 65
LDI r2, 24
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 27
LDI r6, 181
LDI r7, 46
LDI r8, 119
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
