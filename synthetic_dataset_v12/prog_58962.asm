; DESCRIPTION: Composite: Places a blue circle of radius 11 at center (283, 180) then Renders a cyan line between points (116, 92) and (273, 1).
; PLAN: r0=283(x), r1=180(y), r2=11(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=116(x1), r6=92(y1), r7=273(x2), r8=1(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 283
LDI r1, 180
LDI r2, 11
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 116
LDI r6, 92
LDI r7, 273
LDI r8, 1
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
