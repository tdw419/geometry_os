; DESCRIPTION: Composite: Renders a cyan disk with center (91, 182) and radius 56 then Places a cyan line segment connecting (260, 231) to (44, 21).
; PLAN: r0=91(x), r1=182(y), r2=56(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=260(x1), r6=231(y1), r7=44(x2), r8=21(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 91
LDI r1, 182
LDI r2, 56
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 260
LDI r6, 231
LDI r7, 44
LDI r8, 21
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
