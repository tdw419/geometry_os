; DESCRIPTION: Composite: Places a cyan circle of radius 33 at center (312, 221) then Draws a blue line from (273, 5) to (6, 160).
; PLAN: r0=312(x), r1=221(y), r2=33(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=273(x1), r6=5(y1), r7=6(x2), r8=160(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 312
LDI r1, 221
LDI r2, 33
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 273
LDI r6, 5
LDI r7, 6
LDI r8, 160
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
