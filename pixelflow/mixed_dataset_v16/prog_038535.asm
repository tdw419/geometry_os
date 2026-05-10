; DESCRIPTION: Composite: Draws a blue line from (417, 91) to (193, 30) then Renders a yellow disk with center (223, 72) and radius 42.
; PLAN: r0=417(x1), r1=91(y1), r2=193(x2), r3=30(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=223(x), r6=72(y), r7=42(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 417
LDI r1, 91
LDI r2, 193
LDI r3, 30
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 223
LDI r6, 72
LDI r7, 42
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
