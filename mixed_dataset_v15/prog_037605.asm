; DESCRIPTION: Composite: Places a cyan dot at position (94, 168) then Draws a green line from (265, 246) to (222, 21) then Renders a blue disk with center (145, 111) and radius 76.
; PLAN: r0=94(x), r1=168(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=265(x1), r6=246(y1), r7=222(x2), r8=21(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=145(x), r11=111(y), r12=76(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 94
LDI r1, 168
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 265
LDI r6, 246
LDI r7, 222
LDI r8, 21
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 145
LDI r11, 111
LDI r12, 76
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
