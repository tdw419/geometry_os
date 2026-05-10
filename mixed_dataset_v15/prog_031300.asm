; DESCRIPTION: Composite: Places a green circle of radius 59 at center (272, 101) then Renders a cyan line between points (100, 94) and (431, 138).
; PLAN: r0=272(x), r1=101(y), r2=59(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=100(x1), r6=94(y1), r7=431(x2), r8=138(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 272
LDI r1, 101
LDI r2, 59
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 100
LDI r6, 94
LDI r7, 431
LDI r8, 138
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
