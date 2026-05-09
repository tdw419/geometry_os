; DESCRIPTION: Composite: Renders a white disk with center (123, 177) and radius 33 then Places a blue line segment connecting (263, 133) to (169, 104).
; PLAN: r0=123(x), r1=177(y), r2=33(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=263(x1), r6=133(y1), r7=169(x2), r8=104(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 123
LDI r1, 177
LDI r2, 33
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 263
LDI r6, 133
LDI r7, 169
LDI r8, 104
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
