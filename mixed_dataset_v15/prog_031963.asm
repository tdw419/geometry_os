; DESCRIPTION: Composite: Places a red circle of radius 62 at center (196, 73) then Places a magenta line segment connecting (3, 48) to (433, 121).
; PLAN: r0=196(x), r1=73(y), r2=62(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=3(x1), r6=48(y1), r7=433(x2), r8=121(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 196
LDI r1, 73
LDI r2, 62
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 3
LDI r6, 48
LDI r7, 433
LDI r8, 121
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
