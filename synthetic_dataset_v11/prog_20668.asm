; DESCRIPTION: Composite: . Then Renders a magenta line between points (171, 240) and (252, 127). Then Creates a blue circular shape at (226, 206) with radius 21.
; PLAN: r0=171(x1), r1=240(y1), r2=252(x2), r3=127(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=226(x), r1=206(y), r2=21(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a magenta line between points (171, 240) and (252, 127).
; PLAN: r0=171(x1), r1=240(y1), r2=252(x2), r3=127(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 240
LDI r2, 252
LDI r3, 127
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a blue circular shape at (226, 206) with radius 21.
; PLAN: r0=226(x), r1=206(y), r2=21(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 226
LDI r1, 206
LDI r2, 21
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
