; DESCRIPTION: Composite: Renders a white line between points (8, 146) and (145, 202) then Draws a green circle centered at (243, 178) with radius 75.
; PLAN: r0=8(x1), r1=146(y1), r2=145(x2), r3=202(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=243(x), r6=178(y), r7=75(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 8
LDI r1, 146
LDI r2, 145
LDI r3, 202
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 243
LDI r6, 178
LDI r7, 75
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
