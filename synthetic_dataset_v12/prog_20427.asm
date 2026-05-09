; DESCRIPTION: Composite: Renders a green disk with center (159, 164) and radius 76 then Places a green line segment connecting (404, 155) to (411, 153).
; PLAN: r0=159(x), r1=164(y), r2=76(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=404(x1), r6=155(y1), r7=411(x2), r8=153(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 159
LDI r1, 164
LDI r2, 76
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 404
LDI r6, 155
LDI r7, 411
LDI r8, 153
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
