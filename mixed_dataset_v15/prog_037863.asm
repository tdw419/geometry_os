; DESCRIPTION: Composite: Places a yellow circle of radius 67 at center (88, 85) then Renders a orange line between points (286, 239) and (398, 51).
; PLAN: r0=88(x), r1=85(y), r2=67(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=286(x1), r6=239(y1), r7=398(x2), r8=51(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 88
LDI r1, 85
LDI r2, 67
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 286
LDI r6, 239
LDI r7, 398
LDI r8, 51
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
