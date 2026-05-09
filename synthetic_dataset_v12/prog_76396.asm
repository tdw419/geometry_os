; DESCRIPTION: Composite: Renders a red disk with center (204, 85) and radius 80 then Draws a white line from (32, 253) to (99, 10).
; PLAN: r0=204(x), r1=85(y), r2=80(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=32(x1), r6=253(y1), r7=99(x2), r8=10(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 204
LDI r1, 85
LDI r2, 80
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 32
LDI r6, 253
LDI r7, 99
LDI r8, 10
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
