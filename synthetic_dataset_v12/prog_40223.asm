; DESCRIPTION: Composite: Draws a blue line from (166, 184) to (404, 197) then Renders a cyan disk with center (349, 179) and radius 75.
; PLAN: r0=166(x1), r1=184(y1), r2=404(x2), r3=197(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=349(x), r6=179(y), r7=75(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 166
LDI r1, 184
LDI r2, 404
LDI r3, 197
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 349
LDI r6, 179
LDI r7, 75
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
