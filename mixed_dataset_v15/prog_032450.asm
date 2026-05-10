; DESCRIPTION: Composite: Places a black line segment connecting (406, 30) to (3, 242) then Places a green circle of radius 33 at center (349, 48).
; PLAN: r0=406(x1), r1=30(y1), r2=3(x2), r3=242(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=349(x), r6=48(y), r7=33(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 406
LDI r1, 30
LDI r2, 3
LDI r3, 242
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 349
LDI r6, 48
LDI r7, 33
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
