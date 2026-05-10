; DESCRIPTION: Composite: Draws a cyan circle centered at (286, 195) with radius 50 then Renders a yellow line between points (378, 174) and (277, 236).
; PLAN: r0=286(x), r1=195(y), r2=50(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=378(x1), r6=174(y1), r7=277(x2), r8=236(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 286
LDI r1, 195
LDI r2, 50
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 378
LDI r6, 174
LDI r7, 277
LDI r8, 236
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
