; DESCRIPTION: Composite: Renders a white line between points (116, 180) and (108, 77) then Creates a magenta circular shape at (178, 70) with radius 69.
; PLAN: r0=116(x1), r1=180(y1), r2=108(x2), r3=77(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=178(x), r6=70(y), r7=69(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 116
LDI r1, 180
LDI r2, 108
LDI r3, 77
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 178
LDI r6, 70
LDI r7, 69
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
