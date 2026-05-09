; DESCRIPTION: Composite: Renders a black line between points (363, 93) and (70, 142) then Places a magenta circle of radius 22 at center (362, 153).
; PLAN: r0=363(x1), r1=93(y1), r2=70(x2), r3=142(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=362(x), r6=153(y), r7=22(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 363
LDI r1, 93
LDI r2, 70
LDI r3, 142
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 362
LDI r6, 153
LDI r7, 22
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
