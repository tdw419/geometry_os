; DESCRIPTION: Composite: Draws a purple circle centered at (464, 117) with radius 39 then Draws a white line from (402, 72) to (313, 96).
; PLAN: r0=464(x), r1=117(y), r2=39(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=402(x1), r6=72(y1), r7=313(x2), r8=96(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 464
LDI r1, 117
LDI r2, 39
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 402
LDI r6, 72
LDI r7, 313
LDI r8, 96
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
