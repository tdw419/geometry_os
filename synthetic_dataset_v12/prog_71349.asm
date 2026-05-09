; DESCRIPTION: Composite: Creates a red circular shape at (362, 112) with radius 77 then Renders a green line between points (16, 95) and (338, 248).
; PLAN: r0=362(x), r1=112(y), r2=77(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=16(x1), r6=95(y1), r7=338(x2), r8=248(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 362
LDI r1, 112
LDI r2, 77
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 16
LDI r6, 95
LDI r7, 338
LDI r8, 248
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
