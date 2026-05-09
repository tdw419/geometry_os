; DESCRIPTION: Composite: Sets a single green pixel at (279, 153) then Creates a red circular shape at (138, 161) with radius 66 then Places a blue line segment connecting (410, 106) to (299, 50).
; PLAN: r0=279(x), r1=153(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=138(x), r6=161(y), r7=66(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=410(x1), r11=106(y1), r12=299(x2), r13=50(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 279
LDI r1, 153
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 138
LDI r6, 161
LDI r7, 66
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 410
LDI r11, 106
LDI r12, 299
LDI r13, 50
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
