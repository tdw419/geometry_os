; DESCRIPTION: Composite: . Then Places a black circle of radius 14 at center (127, 32). Then Draws a green line from (156, 221) to (94, 53).
; PLAN: r0=127(x), r1=32(y), r2=14(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=156(x1), r1=221(y1), r2=94(x2), r3=53(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black circle of radius 14 at center (127, 32).
; PLAN: r0=127(x), r1=32(y), r2=14(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 127
LDI r1, 32
LDI r2, 14
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a green line from (156, 221) to (94, 53).
; PLAN: r0=156(x1), r1=221(y1), r2=94(x2), r3=53(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 221
LDI r2, 94
LDI r3, 53
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
