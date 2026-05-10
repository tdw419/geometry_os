; DESCRIPTION: Composite: Renders a blue disk with center (417, 60) and radius 47 then Places a blue line segment connecting (181, 151) to (480, 33).
; PLAN: r0=417(x), r1=60(y), r2=47(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=181(x1), r6=151(y1), r7=480(x2), r8=33(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 417
LDI r1, 60
LDI r2, 47
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 181
LDI r6, 151
LDI r7, 480
LDI r8, 33
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
