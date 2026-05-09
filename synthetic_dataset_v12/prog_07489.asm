; DESCRIPTION: Composite: Renders a green line between points (433, 74) and (311, 187) then Renders a magenta disk with center (398, 225) and radius 16.
; PLAN: r0=433(x1), r1=74(y1), r2=311(x2), r3=187(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=398(x), r6=225(y), r7=16(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 433
LDI r1, 74
LDI r2, 311
LDI r3, 187
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 398
LDI r6, 225
LDI r7, 16
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
