; DESCRIPTION: Composite: Places a black line segment connecting (85, 236) to (380, 214) then Renders a orange disk with center (317, 36) and radius 36.
; PLAN: r0=85(x1), r1=236(y1), r2=380(x2), r3=214(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=317(x), r6=36(y), r7=36(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 85
LDI r1, 236
LDI r2, 380
LDI r3, 214
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 317
LDI r6, 36
LDI r7, 36
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
