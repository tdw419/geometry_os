; DESCRIPTION: Composite: Renders a purple disk with center (387, 105) and radius 65 then Renders a yellow line between points (154, 239) and (422, 205).
; PLAN: r0=387(x), r1=105(y), r2=65(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=154(x1), r6=239(y1), r7=422(x2), r8=205(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 387
LDI r1, 105
LDI r2, 65
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 154
LDI r6, 239
LDI r7, 422
LDI r8, 205
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
