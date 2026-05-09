; DESCRIPTION: Composite: Draws a red line from (217, 32) to (283, 129) then Draws a white circle centered at (285, 127) with radius 75.
; PLAN: r0=217(x1), r1=32(y1), r2=283(x2), r3=129(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=285(x), r6=127(y), r7=75(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 217
LDI r1, 32
LDI r2, 283
LDI r3, 129
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 285
LDI r6, 127
LDI r7, 75
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
