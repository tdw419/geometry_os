; DESCRIPTION: Composite: . Then Draws a yellow line from (51, 3) to (195, 202). Then Places a yellow 89x98 rectangle at position (141, 73).
; PLAN: r0=51(x1), r1=3(y1), r2=195(x2), r3=202(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=141(x), r1=73(y), r2=89(width), r3=98(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a yellow line from (51, 3) to (195, 202).
; PLAN: r0=51(x1), r1=3(y1), r2=195(x2), r3=202(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 3
LDI r2, 195
LDI r3, 202
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow 89x98 rectangle at position (141, 73).
; PLAN: r0=141(x), r1=73(y), r2=89(width), r3=98(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 73
LDI r2, 89
LDI r3, 98
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
