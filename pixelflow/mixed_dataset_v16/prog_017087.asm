; DESCRIPTION: Composite: Renders a purple disk with center (86, 196) and radius 51 then Places a blue line segment connecting (380, 171) to (498, 243).
; PLAN: r0=86(x), r1=196(y), r2=51(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=380(x1), r6=171(y1), r7=498(x2), r8=243(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 86
LDI r1, 196
LDI r2, 51
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 380
LDI r6, 171
LDI r7, 498
LDI r8, 243
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
