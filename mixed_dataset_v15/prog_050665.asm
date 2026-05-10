; DESCRIPTION: Composite: Renders a magenta disk with center (243, 133) and radius 71 then Draws a green line from (75, 163) to (340, 109).
; PLAN: r0=243(x), r1=133(y), r2=71(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=75(x1), r6=163(y1), r7=340(x2), r8=109(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 243
LDI r1, 133
LDI r2, 71
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 75
LDI r6, 163
LDI r7, 340
LDI r8, 109
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
