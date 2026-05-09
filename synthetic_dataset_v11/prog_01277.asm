; DESCRIPTION: Composite: . Then Draws a yellow line from (223, 6) to (0, 57). Then Places a green circle of radius 18 at center (168, 157).
; PLAN: r0=223(x1), r1=6(y1), r2=0(x2), r3=57(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=168(x), r1=157(y), r2=18(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a yellow line from (223, 6) to (0, 57).
; PLAN: r0=223(x1), r1=6(y1), r2=0(x2), r3=57(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 6
LDI r2, 0
LDI r3, 57
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a green circle of radius 18 at center (168, 157).
; PLAN: r0=168(x), r1=157(y), r2=18(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 168
LDI r1, 157
LDI r2, 18
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
