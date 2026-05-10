; DESCRIPTION: Composite: Places a cyan line segment connecting (419, 110) to (165, 23) then Renders a orange disk with center (235, 93) and radius 18.
; PLAN: r0=419(x1), r1=110(y1), r2=165(x2), r3=23(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=235(x), r6=93(y), r7=18(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 419
LDI r1, 110
LDI r2, 165
LDI r3, 23
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 235
LDI r6, 93
LDI r7, 18
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
