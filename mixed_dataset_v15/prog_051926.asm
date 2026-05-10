; DESCRIPTION: Composite: Renders a white disk with center (147, 213) and radius 30 then Draws a white line from (405, 189) to (360, 138).
; PLAN: r0=147(x), r1=213(y), r2=30(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=405(x1), r6=189(y1), r7=360(x2), r8=138(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 147
LDI r1, 213
LDI r2, 30
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 405
LDI r6, 189
LDI r7, 360
LDI r8, 138
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
