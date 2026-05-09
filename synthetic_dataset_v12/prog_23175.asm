; DESCRIPTION: Composite: Creates a blue circular shape at (299, 66) with radius 61 then Draws a purple line from (56, 0) to (284, 207).
; PLAN: r0=299(x), r1=66(y), r2=61(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=56(x1), r6=0(y1), r7=284(x2), r8=207(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 299
LDI r1, 66
LDI r2, 61
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 56
LDI r6, 0
LDI r7, 284
LDI r8, 207
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
