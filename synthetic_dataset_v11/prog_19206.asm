; DESCRIPTION: Composite: . Then Places a red 51x120 rectangle at position (150, 58). Then Places a blue line segment connecting (212, 63) to (227, 2).
; PLAN: r0=150(x), r1=58(y), r2=51(width), r3=120(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=212(x1), r1=63(y1), r2=227(x2), r3=2(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red 51x120 rectangle at position (150, 58).
; PLAN: r0=150(x), r1=58(y), r2=51(width), r3=120(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 58
LDI r2, 51
LDI r3, 120
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a blue line segment connecting (212, 63) to (227, 2).
; PLAN: r0=212(x1), r1=63(y1), r2=227(x2), r3=2(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 63
LDI r2, 227
LDI r3, 2
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
