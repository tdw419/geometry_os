; DESCRIPTION: Composite: Places a red circle of radius 16 at center (32, 22) then Renders a black line between points (366, 181) and (475, 165).
; PLAN: r0=32(x), r1=22(y), r2=16(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=366(x1), r6=181(y1), r7=475(x2), r8=165(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 32
LDI r1, 22
LDI r2, 16
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 366
LDI r6, 181
LDI r7, 475
LDI r8, 165
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
