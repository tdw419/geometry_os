; DESCRIPTION: Composite: Places a blue circle of radius 27 at center (45, 207) then Places a blue line segment connecting (403, 220) to (16, 136).
; PLAN: r0=45(x), r1=207(y), r2=27(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=403(x1), r6=220(y1), r7=16(x2), r8=136(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 45
LDI r1, 207
LDI r2, 27
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 403
LDI r6, 220
LDI r7, 16
LDI r8, 136
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
