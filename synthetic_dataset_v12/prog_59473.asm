; DESCRIPTION: Composite: Places a red circle of radius 53 at center (89, 195) then Places a blue line segment connecting (340, 220) to (12, 99).
; PLAN: r0=89(x), r1=195(y), r2=53(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=340(x1), r6=220(y1), r7=12(x2), r8=99(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 89
LDI r1, 195
LDI r2, 53
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 340
LDI r6, 220
LDI r7, 12
LDI r8, 99
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
