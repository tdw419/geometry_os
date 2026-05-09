; DESCRIPTION: Composite: Places a green circle of radius 46 at center (82, 190) then Renders a white line between points (91, 206) and (269, 159).
; PLAN: r0=82(x), r1=190(y), r2=46(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=91(x1), r6=206(y1), r7=269(x2), r8=159(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 82
LDI r1, 190
LDI r2, 46
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 91
LDI r6, 206
LDI r7, 269
LDI r8, 159
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
