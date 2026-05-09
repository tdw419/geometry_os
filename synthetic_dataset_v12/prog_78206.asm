; DESCRIPTION: Composite: Places a cyan line segment connecting (464, 145) to (83, 217) then Renders a magenta disk with center (185, 124) and radius 30.
; PLAN: r0=464(x1), r1=145(y1), r2=83(x2), r3=217(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=185(x), r6=124(y), r7=30(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 464
LDI r1, 145
LDI r2, 83
LDI r3, 217
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 185
LDI r6, 124
LDI r7, 30
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
