; DESCRIPTION: Composite: Places a green circle of radius 42 at center (411, 42) then Renders a green line between points (91, 181) and (26, 98).
; PLAN: r0=411(x), r1=42(y), r2=42(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=91(x1), r6=181(y1), r7=26(x2), r8=98(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 411
LDI r1, 42
LDI r2, 42
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 91
LDI r6, 181
LDI r7, 26
LDI r8, 98
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
