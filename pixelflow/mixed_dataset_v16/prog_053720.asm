; DESCRIPTION: Composite: Draws a red circle centered at (387, 200) with radius 52 then Draws a white line from (30, 99) to (416, 73).
; PLAN: r0=387(x), r1=200(y), r2=52(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=30(x1), r6=99(y1), r7=416(x2), r8=73(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 387
LDI r1, 200
LDI r2, 52
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 30
LDI r6, 99
LDI r7, 416
LDI r8, 73
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
