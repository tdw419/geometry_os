; DESCRIPTION: Composite: Places a white circle of radius 53 at center (458, 55) then Draws a white line from (331, 103) to (125, 169).
; PLAN: r0=458(x), r1=55(y), r2=53(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=331(x1), r6=103(y1), r7=125(x2), r8=169(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 458
LDI r1, 55
LDI r2, 53
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 331
LDI r6, 103
LDI r7, 125
LDI r8, 169
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
