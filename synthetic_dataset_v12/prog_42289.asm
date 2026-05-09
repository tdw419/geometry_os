; DESCRIPTION: Composite: Renders a green line between points (474, 61) and (481, 220) then Places a white circle of radius 76 at center (88, 152).
; PLAN: r0=474(x1), r1=61(y1), r2=481(x2), r3=220(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=88(x), r6=152(y), r7=76(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 474
LDI r1, 61
LDI r2, 481
LDI r3, 220
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 88
LDI r6, 152
LDI r7, 76
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
