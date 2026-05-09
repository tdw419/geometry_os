; DESCRIPTION: Composite: Places a white dot at position (143, 176) then Draws a red line from (140, 7) to (359, 80) then Renders a blue disk with center (240, 213) and radius 27.
; PLAN: r0=143(x), r1=176(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=140(x1), r6=7(y1), r7=359(x2), r8=80(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=240(x), r11=213(y), r12=27(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 143
LDI r1, 176
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 140
LDI r6, 7
LDI r7, 359
LDI r8, 80
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 240
LDI r11, 213
LDI r12, 27
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
