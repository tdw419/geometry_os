; DESCRIPTION: Composite: Places a green line segment connecting (162, 168) to (360, 247) then Renders a yellow disk with center (319, 107) and radius 11.
; PLAN: r0=162(x1), r1=168(y1), r2=360(x2), r3=247(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=319(x), r6=107(y), r7=11(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 162
LDI r1, 168
LDI r2, 360
LDI r3, 247
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 319
LDI r6, 107
LDI r7, 11
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
