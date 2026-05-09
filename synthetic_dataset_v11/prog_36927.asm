; DESCRIPTION: Composite: . Then Places a yellow 51x13 rectangle at position (15, 118). Then Draws a green line from (151, 86) to (52, 153).
; PLAN: r0=15(x), r1=118(y), r2=51(width), r3=13(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=151(x1), r1=86(y1), r2=52(x2), r3=153(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a yellow 51x13 rectangle at position (15, 118).
; PLAN: r0=15(x), r1=118(y), r2=51(width), r3=13(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 118
LDI r2, 51
LDI r3, 13
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a green line from (151, 86) to (52, 153).
; PLAN: r0=151(x1), r1=86(y1), r2=52(x2), r3=153(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 86
LDI r2, 52
LDI r3, 153
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
