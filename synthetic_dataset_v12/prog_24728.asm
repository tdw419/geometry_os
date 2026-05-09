; DESCRIPTION: Composite: Draws a white line from (422, 29) to (235, 220) then Renders a black disk with center (310, 186) and radius 34.
; PLAN: r0=422(x1), r1=29(y1), r2=235(x2), r3=220(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=310(x), r6=186(y), r7=34(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 422
LDI r1, 29
LDI r2, 235
LDI r3, 220
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 310
LDI r6, 186
LDI r7, 34
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
