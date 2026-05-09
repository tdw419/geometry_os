; DESCRIPTION: Composite: Renders a green disk with center (69, 121) and radius 59 then Renders a white line between points (460, 26) and (35, 225).
; PLAN: r0=69(x), r1=121(y), r2=59(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=460(x1), r6=26(y1), r7=35(x2), r8=225(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 69
LDI r1, 121
LDI r2, 59
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 460
LDI r6, 26
LDI r7, 35
LDI r8, 225
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
