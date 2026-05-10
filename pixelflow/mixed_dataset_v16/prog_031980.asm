; DESCRIPTION: Composite: Draws a white line from (154, 34) to (449, 34) then Renders a white disk with center (342, 152) and radius 60.
; PLAN: r0=154(x1), r1=34(y1), r2=449(x2), r3=34(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=342(x), r6=152(y), r7=60(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 154
LDI r1, 34
LDI r2, 449
LDI r3, 34
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 342
LDI r6, 152
LDI r7, 60
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
