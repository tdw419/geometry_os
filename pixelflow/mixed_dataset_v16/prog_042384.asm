; DESCRIPTION: Composite: Renders a blue disk with center (91, 134) and radius 59 then Draws a yellow line from (135, 240) to (82, 119).
; PLAN: r0=91(x), r1=134(y), r2=59(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=135(x1), r6=240(y1), r7=82(x2), r8=119(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 91
LDI r1, 134
LDI r2, 59
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 135
LDI r6, 240
LDI r7, 82
LDI r8, 119
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
