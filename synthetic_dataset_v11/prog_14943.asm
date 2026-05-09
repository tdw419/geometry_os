; DESCRIPTION: Composite: . Then Draws a black line from (46, 133) to (99, 212). Then Places a magenta circle of radius 48 at center (156, 83).
; PLAN: r0=46(x1), r1=133(y1), r2=99(x2), r3=212(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=156(x), r1=83(y), r2=48(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a black line from (46, 133) to (99, 212).
; PLAN: r0=46(x1), r1=133(y1), r2=99(x2), r3=212(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 133
LDI r2, 99
LDI r3, 212
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta circle of radius 48 at center (156, 83).
; PLAN: r0=156(x), r1=83(y), r2=48(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 156
LDI r1, 83
LDI r2, 48
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
