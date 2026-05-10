; DESCRIPTION: Composite: Places a blue dot at position (118, 5) then Places a black line segment connecting (487, 216) to (102, 120) then Renders a red disk with center (220, 168) and radius 51.
; PLAN: r0=118(x), r1=5(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=487(x1), r6=216(y1), r7=102(x2), r8=120(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=220(x), r11=168(y), r12=51(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 118
LDI r1, 5
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 487
LDI r6, 216
LDI r7, 102
LDI r8, 120
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 220
LDI r11, 168
LDI r12, 51
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
