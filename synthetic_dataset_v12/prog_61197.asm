; DESCRIPTION: Composite: Draws a magenta circle centered at (227, 157) with radius 61 then Renders a green line between points (443, 225) and (474, 186).
; PLAN: r0=227(x), r1=157(y), r2=61(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=443(x1), r6=225(y1), r7=474(x2), r8=186(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 227
LDI r1, 157
LDI r2, 61
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 443
LDI r6, 225
LDI r7, 474
LDI r8, 186
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
