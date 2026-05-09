; DESCRIPTION: Composite: Places a red circle of radius 11 at center (394, 116) then Places a blue line segment connecting (187, 145) to (2, 48).
; PLAN: r0=394(x), r1=116(y), r2=11(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=187(x1), r6=145(y1), r7=2(x2), r8=48(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 394
LDI r1, 116
LDI r2, 11
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 187
LDI r6, 145
LDI r7, 2
LDI r8, 48
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
