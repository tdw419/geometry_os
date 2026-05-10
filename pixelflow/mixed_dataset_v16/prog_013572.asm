; DESCRIPTION: Composite: Draws a white line from (371, 131) to (403, 55) then Renders a yellow disk with center (396, 150) and radius 70.
; PLAN: r0=371(x1), r1=131(y1), r2=403(x2), r3=55(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=396(x), r6=150(y), r7=70(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 371
LDI r1, 131
LDI r2, 403
LDI r3, 55
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 396
LDI r6, 150
LDI r7, 70
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
