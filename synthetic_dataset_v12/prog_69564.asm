; DESCRIPTION: Composite: Renders a blue line between points (46, 172) and (199, 186) then Creates a red circular shape at (310, 215) with radius 27.
; PLAN: r0=46(x1), r1=172(y1), r2=199(x2), r3=186(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=310(x), r6=215(y), r7=27(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 46
LDI r1, 172
LDI r2, 199
LDI r3, 186
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 310
LDI r6, 215
LDI r7, 27
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
