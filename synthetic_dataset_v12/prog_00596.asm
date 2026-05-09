; DESCRIPTION: Composite: Renders a black disk with center (252, 173) and radius 48 then Places a green line segment connecting (95, 221) to (149, 117).
; PLAN: r0=252(x), r1=173(y), r2=48(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=95(x1), r6=221(y1), r7=149(x2), r8=117(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 252
LDI r1, 173
LDI r2, 48
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 95
LDI r6, 221
LDI r7, 149
LDI r8, 117
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
