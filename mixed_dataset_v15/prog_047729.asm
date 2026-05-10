; DESCRIPTION: Composite: Renders a white line between points (392, 4) and (111, 44) then Renders a green disk with center (33, 209) and radius 21.
; PLAN: r0=392(x1), r1=4(y1), r2=111(x2), r3=44(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=33(x), r6=209(y), r7=21(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 392
LDI r1, 4
LDI r2, 111
LDI r3, 44
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 33
LDI r6, 209
LDI r7, 21
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
