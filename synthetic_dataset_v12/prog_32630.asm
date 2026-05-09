; DESCRIPTION: Composite: Renders a yellow line between points (300, 91) and (69, 74) then Places a blue dot at position (234, 0).
; PLAN: r0=300(x1), r1=91(y1), r2=69(x2), r3=74(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=234(x), r6=0(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 300
LDI r1, 91
LDI r2, 69
LDI r3, 74
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 234
LDI r6, 0
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
