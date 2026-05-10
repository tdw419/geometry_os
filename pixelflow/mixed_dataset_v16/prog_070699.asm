; DESCRIPTION: Composite: Places a blue line segment connecting (46, 76) to (267, 1) then Renders a cyan disk with center (264, 108) and radius 31.
; PLAN: r0=46(x1), r1=76(y1), r2=267(x2), r3=1(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=264(x), r6=108(y), r7=31(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 46
LDI r1, 76
LDI r2, 267
LDI r3, 1
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 264
LDI r6, 108
LDI r7, 31
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
