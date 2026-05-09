; DESCRIPTION: Composite: Places a magenta dot at position (20, 166) then Places a red circle of radius 41 at center (389, 157) then Places a magenta line segment connecting (3, 6) to (255, 48).
; PLAN: r0=20(x), r1=166(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=389(x), r6=157(y), r7=41(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=3(x1), r11=6(y1), r12=255(x2), r13=48(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 20
LDI r1, 166
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 389
LDI r6, 157
LDI r7, 41
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 3
LDI r11, 6
LDI r12, 255
LDI r13, 48
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
