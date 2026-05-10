; DESCRIPTION: Composite: Renders a purple disk with center (486, 28) and radius 23 then Places a green line segment connecting (496, 98) to (401, 132).
; PLAN: r0=486(x), r1=28(y), r2=23(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=496(x1), r6=98(y1), r7=401(x2), r8=132(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 486
LDI r1, 28
LDI r2, 23
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 496
LDI r6, 98
LDI r7, 401
LDI r8, 132
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
