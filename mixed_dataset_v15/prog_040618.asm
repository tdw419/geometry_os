; DESCRIPTION: Composite: Renders a red disk with center (433, 88) and radius 66 then Places a magenta line segment connecting (218, 108) to (11, 116).
; PLAN: r0=433(x), r1=88(y), r2=66(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=218(x1), r6=108(y1), r7=11(x2), r8=116(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 433
LDI r1, 88
LDI r2, 66
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 218
LDI r6, 108
LDI r7, 11
LDI r8, 116
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
