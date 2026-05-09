; DESCRIPTION: Composite: Places a white line segment connecting (246, 44) to (143, 187) then Renders a blue disk with center (368, 209) and radius 22.
; PLAN: r0=246(x1), r1=44(y1), r2=143(x2), r3=187(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=368(x), r6=209(y), r7=22(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 246
LDI r1, 44
LDI r2, 143
LDI r3, 187
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 368
LDI r6, 209
LDI r7, 22
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
