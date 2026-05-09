; DESCRIPTION: Composite: Renders a yellow disk with center (463, 164) and radius 10 then Renders a green line between points (401, 44) and (460, 116).
; PLAN: r0=463(x), r1=164(y), r2=10(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=401(x1), r6=44(y1), r7=460(x2), r8=116(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 463
LDI r1, 164
LDI r2, 10
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 401
LDI r6, 44
LDI r7, 460
LDI r8, 116
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
