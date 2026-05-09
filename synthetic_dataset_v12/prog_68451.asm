; DESCRIPTION: Composite: Renders a green line between points (205, 135) and (349, 134) then Renders a magenta disk with center (185, 161) and radius 65.
; PLAN: r0=205(x1), r1=135(y1), r2=349(x2), r3=134(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=185(x), r6=161(y), r7=65(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 205
LDI r1, 135
LDI r2, 349
LDI r3, 134
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 185
LDI r6, 161
LDI r7, 65
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
