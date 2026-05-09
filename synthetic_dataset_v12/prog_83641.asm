; DESCRIPTION: Composite: Places a green circle of radius 69 at center (345, 159) then Draws a red line from (308, 182) to (406, 18).
; PLAN: r0=345(x), r1=159(y), r2=69(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=308(x1), r6=182(y1), r7=406(x2), r8=18(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 345
LDI r1, 159
LDI r2, 69
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 308
LDI r6, 182
LDI r7, 406
LDI r8, 18
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
