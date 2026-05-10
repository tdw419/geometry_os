; DESCRIPTION: Composite: Renders a red disk with center (290, 26) and radius 23 then Places a green line segment connecting (150, 233) to (479, 155).
; PLAN: r0=290(x), r1=26(y), r2=23(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=150(x1), r6=233(y1), r7=479(x2), r8=155(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 290
LDI r1, 26
LDI r2, 23
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 150
LDI r6, 233
LDI r7, 479
LDI r8, 155
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
