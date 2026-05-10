; DESCRIPTION: Composite: Renders a green line between points (143, 138) and (117, 195) then Draws a green circle centered at (75, 97) with radius 69.
; PLAN: r0=143(x1), r1=138(y1), r2=117(x2), r3=195(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=75(x), r6=97(y), r7=69(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 143
LDI r1, 138
LDI r2, 117
LDI r3, 195
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 75
LDI r6, 97
LDI r7, 69
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
