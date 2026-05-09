; DESCRIPTION: Composite: Renders a magenta line between points (404, 127) and (135, 80) then Places a cyan circle of radius 44 at center (232, 166).
; PLAN: r0=404(x1), r1=127(y1), r2=135(x2), r3=80(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=232(x), r6=166(y), r7=44(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 404
LDI r1, 127
LDI r2, 135
LDI r3, 80
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 232
LDI r6, 166
LDI r7, 44
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
