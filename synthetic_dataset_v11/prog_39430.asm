; DESCRIPTION: Composite: . Then Renders a green disk with center (116, 104) and radius 29. Then Draws a yellow line from (250, 127) to (198, 1).
; PLAN: r0=116(x), r1=104(y), r2=29(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=250(x1), r1=127(y1), r2=198(x2), r3=1(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a green disk with center (116, 104) and radius 29.
; PLAN: r0=116(x), r1=104(y), r2=29(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 116
LDI r1, 104
LDI r2, 29
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a yellow line from (250, 127) to (198, 1).
; PLAN: r0=250(x1), r1=127(y1), r2=198(x2), r3=1(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 127
LDI r2, 198
LDI r3, 1
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
