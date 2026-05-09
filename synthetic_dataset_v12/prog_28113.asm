; DESCRIPTION: Composite: Places a green circle of radius 63 at center (132, 146) then Renders a cyan line between points (448, 179) and (202, 115).
; PLAN: r0=132(x), r1=146(y), r2=63(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=448(x1), r6=179(y1), r7=202(x2), r8=115(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 132
LDI r1, 146
LDI r2, 63
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 448
LDI r6, 179
LDI r7, 202
LDI r8, 115
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
