; DESCRIPTION: Composite: . Then Draws a blue circle centered at (92, 176) with radius 80. Then Draws a red line from (156, 202) to (143, 97).
; PLAN: r0=92(x), r1=176(y), r2=80(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=156(x1), r1=202(y1), r2=143(x2), r3=97(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a blue circle centered at (92, 176) with radius 80.
; PLAN: r0=92(x), r1=176(y), r2=80(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 92
LDI r1, 176
LDI r2, 80
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a red line from (156, 202) to (143, 97).
; PLAN: r0=156(x1), r1=202(y1), r2=143(x2), r3=97(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 202
LDI r2, 143
LDI r3, 97
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
