; DESCRIPTION: Composite: Places a white line segment connecting (255, 21) to (366, 194) then Renders a black disk with center (278, 179) and radius 57.
; PLAN: r0=255(x1), r1=21(y1), r2=366(x2), r3=194(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=278(x), r6=179(y), r7=57(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 255
LDI r1, 21
LDI r2, 366
LDI r3, 194
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 278
LDI r6, 179
LDI r7, 57
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
