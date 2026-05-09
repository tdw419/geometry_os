; DESCRIPTION: Composite: Draws a green line from (250, 70) to (415, 170) then Renders a green disk with center (271, 61) and radius 26.
; PLAN: r0=250(x1), r1=70(y1), r2=415(x2), r3=170(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=271(x), r6=61(y), r7=26(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 250
LDI r1, 70
LDI r2, 415
LDI r3, 170
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 271
LDI r6, 61
LDI r7, 26
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
