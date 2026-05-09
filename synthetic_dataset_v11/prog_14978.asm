; DESCRIPTION: Composite: . Then Draws a magenta line from (207, 220) to (233, 128). Then Places a black circle of radius 72 at center (115, 156).
; PLAN: r0=207(x1), r1=220(y1), r2=233(x2), r3=128(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=115(x), r1=156(y), r2=72(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a magenta line from (207, 220) to (233, 128).
; PLAN: r0=207(x1), r1=220(y1), r2=233(x2), r3=128(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 220
LDI r2, 233
LDI r3, 128
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a black circle of radius 72 at center (115, 156).
; PLAN: r0=115(x), r1=156(y), r2=72(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 115
LDI r1, 156
LDI r2, 72
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
