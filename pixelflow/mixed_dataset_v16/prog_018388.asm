; DESCRIPTION: Composite: Sets a single white pixel at (146, 230) then Draws a yellow line from (81, 141) to (407, 227).
; PLAN: r0=146(x), r1=230(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=81(x1), r6=141(y1), r7=407(x2), r8=227(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 146
LDI r1, 230
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 81
LDI r6, 141
LDI r7, 407
LDI r8, 227
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
