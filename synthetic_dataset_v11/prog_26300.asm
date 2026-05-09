; DESCRIPTION: Composite: . Then Places a black circle of radius 53 at center (146, 114). Then Draws a green line from (212, 63) to (74, 64).
; PLAN: r0=146(x), r1=114(y), r2=53(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=212(x1), r1=63(y1), r2=74(x2), r3=64(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black circle of radius 53 at center (146, 114).
; PLAN: r0=146(x), r1=114(y), r2=53(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 114
LDI r2, 53
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a green line from (212, 63) to (74, 64).
; PLAN: r0=212(x1), r1=63(y1), r2=74(x2), r3=64(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 63
LDI r2, 74
LDI r3, 64
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
