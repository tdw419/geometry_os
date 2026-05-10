; DESCRIPTION: Composite: Draws a black line from (138, 229) to (203, 112) then Renders a white disk with center (113, 120) and radius 50.
; PLAN: r0=138(x1), r1=229(y1), r2=203(x2), r3=112(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=113(x), r6=120(y), r7=50(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 138
LDI r1, 229
LDI r2, 203
LDI r3, 112
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 113
LDI r6, 120
LDI r7, 50
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
